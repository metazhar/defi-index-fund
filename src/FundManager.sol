// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// // This functionality will be separated from the vault
// // the concept of fundManager might just be the vault creator in the beginning,
// //  but could expand to be creator, DAO, or an appointed portfolio manager

// contract FundManager is ERC20 {
//     address public admin;

//     constructor() ERC20("IndexFundToken", "IFT") {
//         admin = msg.sender;
//     }

//     function deposit(uint256 amount) external {
//         // Logic to accept user deposit in different tokens
//         // Convert token to a standard internal representation, maybe a stablecoin or wrapped ETH
//         // Issue equivalent IFT tokens to the depositor

//         // For demonstration:

//         _mint(msg.sender, amount); // You'd mint tokens based on the amount and NAV
//     }

//     function withdraw(uint256 amount) external {
//         // Logic to handle withdrawals
//         // Convert internal representation back to desired token
//         // Burn the IFT tokens

//         // For demonstration:
//         _burn(msg.sender, amount);
//     }

//     function rebalance() external {
//         // Logic to rebalance the fund
//         // This may be called externally by arbitrageurs to assist rebalance to the index weights
//         // Implementation pending
//     }

//     function setAdmin(address newAdmin) external {
//         require(msg.sender == admin, "Only admin can set new admin");
//         admin = newAdmin;
//     }

//     function getAdmin() external view returns (address) {
//         return admin;
//     }
// }
