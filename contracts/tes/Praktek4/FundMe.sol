// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AggregatorV3Interface} from "contracts/AggregatorV3Interface.sol";
import "contracts/tes/Praktek4/PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;
    
    address[] public funders;
    mapping (address => uint256) public addressToAmountFunded;
    uint256 minimumUSD = 50 * 1e18;
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value > 1e18, "Maaf nilai yang anda donasikan kurang");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function withdraw() public onlyOwner {
        for (uint256 funderIndex=0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        
        //reset array
        funders = new address[](0);

        //call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call Failed");
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Pengirim bukan seorang owner!");
        _;
    }
}