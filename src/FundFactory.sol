// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./FundManager.sol";

contract FundFactory {
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
}
