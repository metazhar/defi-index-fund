// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Vault {
    address public manager; // The address that has the power to move funds (should be a DAO or a multi-sig in reality).

    constructor() {
        manager = msg.sender;
    }

    modifier onlyManager() {
        require(msg.sender == manager, "Not authorized");
        _;
    }

    function deposit(address tokenAddress, uint256 amount) external {
        IERC20 token = IERC20(tokenAddress);
        require(token.transferFrom(msg.sender, address(this), amount), "Transfer failed");
    }

    function transfer(address tokenAddress, address to, uint256 amount) external onlyManager {
        IERC20 token = IERC20(tokenAddress);
        require(token.transfer(to, amount), "Transfer failed");
    }

    function withdraw(address tokenAddress, uint256 amount) external onlyManager {
        IERC20 token = IERC20(tokenAddress);
        require(token.transfer(manager, amount), "Transfer failed");
    }
}
