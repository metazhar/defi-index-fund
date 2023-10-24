// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IPriceOracle {
    function getPrice(string memory symbol) external view returns (uint256);
}

contract CryptoPriceOracle is IPriceOracle {
    mapping(string => uint256) private prices;

    function getPrice(string memory symbol) external view override returns (uint256) {
        return prices[symbol];
    }

    function setPrice(string memory symbol, uint256 price) external {
        prices[symbol] = price;
    }
}
