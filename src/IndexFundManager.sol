pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FundManagement is ERC20 {
    address public admin;

    constructor() ERC20("IndexFundToken", "IFT") {
        admin = msg.sender;
    }

    function deposit(uint256 amount, address token) external {
        // Logic to accept user deposit in different tokens
        // Convert token to a standard internal representation, maybe a stablecoin or wrapped ETH
        // Issue equivalent IFT tokens to the depositor

        // For demonstration:
        _mint(msg.sender, amount); // You'd mint tokens based on the amount and NAV
    }

    function withdraw(uint256 amount) external {
        // Logic to handle withdrawals
        // Convert internal representation back to desired token
        // Burn the IFT tokens

        // For demonstration:
        _burn(msg.sender, amount);
    }
}
