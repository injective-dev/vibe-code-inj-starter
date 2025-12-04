# Technical Architecture

## Introduction and Goals
This project aims to build a generative NFT system on the Injective EVM Testnet. The core goals are:
1.  **Efficient Storage:** Minimize gas costs by bit-packing shape data.
2.  **Dynamic Rendering:** Generate visuals off-chain (but verifiable) via a web2 server.
3.  **Sustainable Economy:** Implement a perpetual royalty system directly into the transfer mechanism.

## Solution Strategy
-   **Smart Contract:** Solidity-based ERC721 with custom extensions for storage and payable transfers.
-   **Backend:** Node.js server for metadata API and SVG generation.
-   **Frontend:** Vanilla JS dApp using Viem for blockchain interaction.

## Building Block View

### 1. Smart Contract (Solidity)
-   **Inheritance:** `ERC721`, `Ownable`.
-   **Data Structure:**
    -   `struct Shape { x, y, size, fill, line }` (Packed into `bytes` or `uint256`).
    -   `mapping(uint256 => bytes)`: Stores packed shape data for each Token ID.
    -   `mapping(uint256 => address)`: Stores the "Artist" (original minter) for each Token ID.
-   **Key Functions:**
    -   `mint()`: Payable. Generates random shapes, stores data, sets `msg.sender` as Artist.
    -   `transferWithRoyalty(from, to, tokenId)`: Payable. Custom function to handle transfers + royalty distribution.
    -   `setFees()`: Admin only.
    -   `withdraw()`: Admin only.

### 2. Web2 Server (Node.js)
-   **API Endpoints:**
    -   `GET /metadata/:tokenId`: Returns JSON metadata (OpenSea standard).
    -   `GET /image/:tokenId`: Returns the SVG image.
-   **Components:**
    -   **Contract Reader:** Uses Viem/Ethers to read packed data from the smart contract.
    -   **SVG Generator:** Parses packed data -> Generates SVG string.
    -   **Cache Layer:** In-memory cache (Map) for shape data/SVGs, behind an Adapter interface.

### 3. Frontend (Vanilla JS)
-   **Libraries:** `viem` (Ethereum interaction).
-   **Features:**
    -   Wallet Connection (Metamask).
    -   Read Contract (get owned tokens).
    -   Write Contract (mint, transferWithRoyalty).

## Deployment View
-   **Network:** Injective Testnet EVM (Chain ID: 1439).
-   **RPC:** `https://k8s.testnet.json-rpc.injective.network/`
-   **Hosting:** Localhost (for development).

## Crosscutting Concepts
-   **Bit-Packing:**
    -   Shape: 3 shapes per NFT.
    -   Per Shape:
        -   X (8 bits)
        -   Y (8 bits)
        -   Size (4 bits)
        -   Fill Color (4 bits)
        -   Line Color (4 bits)
        -   Total: 28 bits per shape.
    -   Total per NFT: 3 * 28 = 84 bits. Fits easily in a single `uint256` or `bytes32`.

## Architectural Decisions

### Use of Injective Technologies
-   **Injective EVM:** Chosen for compatibility with Solidity/Hardhat while leveraging Injective's ecosystem.

### Integration of Injective Standards
-   **ERC721:** Standard NFT interface.

## Technology Stack
-   **Smart Contracts:** Solidity, Hardhat, OpenZeppelin.
-   **Backend:** Node.js, Express (or native http), Viem.
-   **Frontend:** HTML/CSS/JS, Viem.
