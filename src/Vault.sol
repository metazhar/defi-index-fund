// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// vault contract for defi index fund
// currently supports erc20 tokens only

contract Vault {
    mapping(address => uint256) public assetBalances;
    address public owner = msg.sender;
    MultiAssetPool public pool;
    uint256 public feePercentage = 1; // 1% for simplicity

    constructor() {
        pool = new MultiAssetPool(address(this));
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    // User deposit to vault
    function deposit(address asset, uint256 amount) external {
        // Transfer asset to vault and increase vault balance
        Token(asset).transfer(address(this), amount);
        assetBalances[asset] += amount;
    }

    // User withdraw from vault
    function withdraw(address asset, uint256 amount) external {
        require(assetBalances[asset] >= amount, "Not enough balance");
        uint256 fee = (feePercentage * amount) / 100;
        uint256 netAmt = amount - fee;

        // Transfer fee to vault manager
        Token(asset).transfer(owner, fee);

        // Transfer the net amount to the user
        assetBalances[asset] -= amount;
        Token(asset).transfer(msg.sender, netAmt);
    }

    function balanceOfAsset(address asset) external view returns (uint256) {
        return assetBalances[asset];
    }

    function transferAssetFrom(address from, address asset, uint256 amount) external {
        require(msg.sender == address(pool), "Unauthorized");
        require(Token(asset).balanceOf(from) >= amount, "Insufficient balance");
        Token(asset).transferFrom(from, address(this), amount);
        assetBalances[asset] += amount;
    }

    function transferAssetTo(address to, address asset, uint256 amount) external {
        require(msg.sender == address(pool), "Unauthorized");
        assetBalances[asset] -= amount;
        Token(asset).transfer(to, amount);
    }
}
