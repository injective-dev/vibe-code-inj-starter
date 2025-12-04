# Product Requirements Document

## Project
**Injective EVM NFT Project**

Participants:
- Developer (Roo)
- User (Project Owner)

Status:
- Planning

Target release:
- TBD

## Goals and Objectives
- Launch a functional ERC721 NFT collection on Injective Testnet EVM.
- Demonstrate efficient on-chain data storage (bit-packing).
- Implement a custom royalty mechanism where royalties are paid in INJ during every transfer.
- Provide a web2 server for dynamic SVG rendering based on on-chain data.
- Provide a vanilla JS dApp for minting, viewing, and transferring NFTs.

## Background and strategic fit
This project serves as a proof-of-concept for building advanced NFT mechanics on Injective's EVM layer, utilizing efficient storage patterns and custom transfer logic.

## Assumptions

### Technical assumptions:
- **Network:** Injective Testnet EVM (Chain ID: 1439).
- **Standard:** ERC721 (OpenZeppelin).
- **Tooling:** Hardhat for contracts, Viem for frontend.
- **Browser:** Modern browser with Metamask or compatible Web3 wallet.

### Business assumptions:
- Users are willing to pay INJ for both gas and the mandatory royalty fee during transfers.
- The "Artist" is defined as the original minter of the NFT.

## User Stories

### User Story 1: Minting
As a user, I want to mint a new NFT by paying a flat fee in INJ, so that I can own a unique generative art piece.
- **Outcome:** User receives an NFT. The smart contract records the user as the "Artist".
- **Fee:** Flat minting fee (paid to smart contract).

### User Story 2: Viewing
As a user, I want to view my NFTs in the dApp, so that I can see the generated artwork.
- **Outcome:** The dApp displays the rendered SVG image fetched from the web2 server.

### User Story 3: Transferring with Royalty
As an owner, I want to transfer my NFT to another address, paying the required royalty fee in INJ, so that the transfer is successful.
- **Outcome:** Ownership changes. Royalty fee is split between the Smart Contract Balance and the Artist.

### User Story 4: Admin Management
As the contract owner, I want to update fees and withdraw accumulated funds, so that I can manage the project's economy.
- **Outcome:** Fees are updated or funds are withdrawn to the owner's wallet.

## User interaction and design

### Wireframes
- **Main Page:**
    - "Connect Wallet" button.
    - "Mint" section (Mint button, Fee display).
    - "My Gallery" section (Grid of owned NFTs).
    - "Transfer" modal/section (Input for recipient address, Transfer button with Fee display).

## Questions
- **Q:** What is the coordinate system for the shapes?
  - **A:** TBD (Assumed 0-255 for byte efficiency).
- **Q:** Is the transfer function strictly ERC721 compliant (non-payable) or custom (payable)?
  - **A:** Custom payable transfer (per requirements).

## What we are not doing
- We are not building a marketplace contract (trading logic is embedded in transfer).
- We are not using frontend frameworks (React, Vue, etc.).
- We are not using IPFS for metadata (metadata is dynamic/server-based).
