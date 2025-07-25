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
