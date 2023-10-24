// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceOracle {
    mapping(address => AggregatorV3Interface) private priceFeeds;

    constructor(address[] memory _tokens, address[] memory _feeds) {
        require(_tokens.length == _feeds.length, "Invalid input length");

        for (uint256 i = 0; i < _tokens.length; i++) {
            priceFeeds[_tokens[i]] = AggregatorV3Interface(_feeds[i]);
        }
    }

    function getPrice(address _token) external view returns (int256) {
        AggregatorV3Interface priceFeed = priceFeeds[_token];
        require(address(priceFeed) != address(0), "Invalid token");

        (, int256 price,,,) = priceFeed.latestRoundData();
        return price;
    }
}
