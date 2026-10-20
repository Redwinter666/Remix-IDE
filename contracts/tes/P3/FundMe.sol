// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable {
        // Memastikan minimal donasi setara dengan $1 USD
        require(msg.value >= 0, "Maaf nilai yg diinput kurang");
        
        // Menambahkan alamat ke daftar funder
        funders.push(msg.sender);
        
        // Menambahkan saldo donasi (menggunakan +=)
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function getVersion() public view returns (uint256) {
        AggregatorV3Interface version = AggregatorV3Interface(0x5077fF71E0e73CcF3fD6023e056c08d21D9AD424);
        return version.version();
    }

    function getPrice() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x5077fF71E0e73CcF3fD6023e056c08d21D9AD424);
        (, int256 price, , , ) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountUSD = (ethPrice * ethAmount) / 1e18;
        return ethAmountUSD;
    }
}