// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "contracts/AggregatorV3Interface.sol";
library PriceConverter {
    function getPrice() internal view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x5077fF71E0e73CcF3fD6023e056c08d21D9AD424);
        (, int256 price,,,) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) internal view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}