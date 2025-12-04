// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GenArtNFT is ERC721, Ownable {
    uint256 public nextTokenId;
    uint256 public mintFee;
    uint256 public royaltyFee;
    uint256 public artistSharePercentage = 50; // Default 50%
    string public baseTokenURI;

    // Mapping from token ID to packed shape data
    // 3 shapes * 28 bits = 84 bits. Fits in uint256.
    // Bit layout per shape (28 bits):
    // [0-7]   X (8 bits)
    // [8-15]  Y (8 bits)
    // [16-19] Size (4 bits)
    // [20-23] Fill Color (4 bits)
    // [24-27] Line Color (4 bits)
    mapping(uint256 => uint256) public tokenShapes;

    // Mapping from token ID to the original artist (minter)
    mapping(uint256 => address) public artists;
    // Mapping to check for duplicate shapes
    mapping(uint256 => bool) public shapeExists;

    event Minted(uint256 indexed tokenId, address indexed artist, uint256 shapesData);
    event RoyaltyPaid(uint256 indexed tokenId, address indexed artist, uint256 amount);
    event FeesUpdated(uint256 mintFee, uint256 royaltyFee);
    event SharePercentageUpdated(uint256 newPercentage);

    constructor(uint256 _mintFee, uint256 _royaltyFee, string memory _baseTokenURI)
        ERC721("GenArtNFT", "GAN")
        Ownable(msg.sender)
    {
        mintFee = _mintFee;
        royaltyFee = _royaltyFee;
        baseTokenURI = _baseTokenURI;
    }

    function mint(uint256 shapesData) external payable {
        require(msg.value >= mintFee, "Insufficient mint fee");

        // Mask to keep only 84 bits (3 shapes * 28 bits)
        // 2^84 - 1 = 0xFFFFFFFFFFFFFFFFFFFFF
        uint256 packedData = shapesData & 0xFFFFFFFFFFFFFFFFFFFFF;
        require(!shapeExists[packedData], "Shape combination already exists");

        uint256 tokenId = nextTokenId++;

        tokenShapes[tokenId] = packedData;
        shapeExists[packedData] = true;
        artists[tokenId] = msg.sender;

        _safeMint(msg.sender, tokenId);

        emit Minted(tokenId, msg.sender, packedData);
    }

    /**
     * @dev Custom transfer function that requires a royalty fee payment.
     * The fee is split between the contract owner (accumulated in contract balance) and the original artist.
     */
    function transferWithRoyalty(address from, address to, uint256 tokenId) external payable {
        require(ownerOf(tokenId) == from, "Incorrect owner");
        // Allow spender to transfer
        require(_isAuthorized(from, msg.sender, tokenId), "Not authorized");
        require(msg.value >= royaltyFee, "Insufficient royalty fee");

        // Transfer NFT
        _transfer(from, to, tokenId);

        // Distribute Royalty
        address artist = artists[tokenId];
        if (artist != address(0)) {
            // Split based on configured percentage
            uint256 artistShare = (msg.value * artistSharePercentage) / 100;

            (bool success, ) = payable(artist).call{value: artistShare}("");
            require(success, "Transfer to artist failed");

            emit RoyaltyPaid(tokenId, artist, artistShare);
        }
    }

    function setFees(uint256 _mintFee, uint256 _royaltyFee) external onlyOwner {
        mintFee = _mintFee;
        royaltyFee = _royaltyFee;
        emit FeesUpdated(_mintFee, _royaltyFee);
    }

    function setArtistSharePercentage(uint256 _percentage) external onlyOwner {
        require(_percentage <= 100, "Percentage must be <= 100");
        artistSharePercentage = _percentage;
        emit SharePercentageUpdated(_percentage);
    }

    function setBaseURI(string memory _baseTokenURI) external onlyOwner {
        baseTokenURI = _baseTokenURI;
    }

    function _baseURI() internal view override returns (string memory) {
        return baseTokenURI;
    }

    function withdraw() external onlyOwner {
        uint256 balance = address(this).balance;
        (bool success, ) = payable(owner()).call{value: balance}("");
        require(success, "Withdraw failed");
    }

    function getShapes(uint256 tokenId) external view returns (uint256) {
        return tokenShapes[tokenId];
    }

    // Disable standard transfer functions to enforce royalty payment
    function transferFrom(address from, address to, uint256 tokenId) public override {
        revert("Use transferWithRoyalty");
    }

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public override {
        revert("Use transferWithRoyalty");
    }
}
