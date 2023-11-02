// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./FundManager.sol";

contract FundFactory {
    // Not implemented yet, but a fund would be the vault that gets deployed which will
    //  hold the assets and issue the tokens, and be based off the index proposal
    //  It will get generated when the index proposal is approved

    address public admin;
    FundManager[] public funds;

    constructor() {
        admin = msg.sender;
    }

    function createFund(string memory name, string memory symbol) external returns (FundManager) {
        FundManager newFund = new FundManager(name, symbol);
        funds.push(newFund);
        return newFund;
    }

    function getFunds() external view returns (FundManager[] memory) {
        return funds;
    }

    function getFund(uint256 index) external view returns (FundManager) {
        return funds[index];
    }

    function getFundCount() external view returns (uint256) {
        return funds.length;
    }

    function getFundName(uint256 index) external view returns (string memory) {
        return funds[index].name();
    }

    function getFundSymbol(uint256 index) external view returns (string memory) {
        return funds[index].symbol();
    }

    function getFundTotalSupply(uint256 index) external view returns (uint256) {
        return funds[index].totalSupply();
    }

    function getFundBalanceOf(uint256 index, address account) external view returns (uint256) {
        return funds[index].balanceOf(account);
    }

    function getFundAllowance(uint256 index, address owner, address spender) external view returns (uint256) {
        return funds[index].allowance(owner, spender);
    }

    function getFundAdmin(uint256 index) external view returns (address) {
        return funds[index].admin();
    }

    function getFundManager(uint256 index) external view returns (address) {
        return funds[index].manager();
    }

    function getFundIndex(uint256 index) external view returns (address) {
        return funds[index].index();
    }
}
