# MGG Token

A comprehensive ERC-20 token implementation for the BSC network.

## Overview

MGG Token is an ERC-20 compliant token built on OpenZeppelin contracts with additional mint and burn functionality.

## Features

- **ERC-20 Standard**: Full compliance with ERC-20 token standard
- **Initial Supply**: 114,600,000,000 MGG tokens
- **Mintable**: Owner can mint additional tokens to any address
- **Burnable**: Users can burn their own tokens
- **Ownable**: Access control for administrative functions

## Contract Details

- **Name**: `MGG Token`
- **Symbol**: `MGG`
- **Decimals**: `18` (default)
- **Initial Supply**: `114,600,000,000 * 10^18`
- **Solidity Version**: `0.8.19`

## Functions

### Public Functions

```solidity
// Mint tokens (only owner)
function mint(address to, uint256 amount) public onlyOwner

// Burn tokens from caller's balance
function burn(uint256 amount) public

// Standard ERC-20 functions inherited from OpenZeppelin
function transfer(address to, uint256 amount) public returns (bool)
function approve(address spender, uint256 amount) public returns (bool)
function transferFrom(address from, address to, uint256 amount) public returns (bool)
```

## Installation

Install dependencies using yarn:

```bash
yarn install
```

## Configuration

Create a `.env` file with the following variables:

```env
MAINNET_RPC_URL=https://bsc-dataseed.binance.org/
TESTNET_RPC_URL=https://data-seed-prebsc-1-s1.binance.org:8545/
MAINNET_PRIVATE_KEY=your_mainnet_private_key
TESTNET_PRIVATE_KEY=your_testnet_private_key
CHAIN_ID=56
TESTNET_CHAIN_ID=97
```

## Deployment

Deploy to different networks:

```bash
# Deploy to BSC Mainnet
yarn deploy:mainnet

# Deploy to BSC Testnet
yarn deploy:testnet
```

## Verification

Verify contracts on BSCscan:

```bash
# Verify on mainnet
yarn verify:mainnet <CONTRACT_ADDRESS>

# Verify on testnet
yarn verify:testnet <CONTRACT_ADDRESS>
```

## Usage Examples

### Basic Token Operations

```javascript
// Deploy the contract
const MGGToken = await ethers.getContractFactory("MGGToken");
const mggToken = await MGGToken.deploy();

// Mint tokens (only owner)
await mggToken.mint(recipientAddress, ethers.utils.parseEther("1000"));

// Burn tokens
await mggToken.burn(ethers.utils.parseEther("100"));

// Transfer tokens
await mggToken.transfer(recipientAddress, ethers.utils.parseEther("50"));

// Check balance
const balance = await mggToken.balanceOf(userAddress);
console.log("Balance:", ethers.utils.formatEther(balance));
```

## Network Configuration

The project is configured for Binance Smart Chain:

- **Mainnet**: Chain ID 56
- **Testnet**: Chain ID 97

## Contract Structure

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MGGToken is ERC20, Ownable {
    uint256 private constant INITIAL_SUPPLY = 114_600_000_000;

    constructor() ERC20("MGG Token", "MGG") {
        _mint(msg.sender, INITIAL_SUPPLY * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
```

## Contract Flattening

Generate flattened contracts for verification:

```bash
yarn flatten
```

## Security Features

- **OpenZeppelin Base**: Built on audited OpenZeppelin ERC20 and Ownable contracts
- **Access Control**: Only owner can mint new tokens
- **No Pause Mechanism**: Simple, straightforward token implementation
- **Standard Compliance**: Full ERC-20 compatibility

## Dependencies

```json
{
  "@openzeppelin/contracts": "^4.9.0"
}
```

## License

This project is licensed under the MIT License.

## Support

For questions and support, please refer to the project documentation or contact the development team.
