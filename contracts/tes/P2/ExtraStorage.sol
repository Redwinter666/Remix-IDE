// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

// Melakukan inheritance dari SimpleStorage
contract ExtraStorage is SimpleStorage {
    
    // Melakukan override pada fungsi store milik SimpleStorage
    function store(uint256 _favoriteNumber) public override {
        favNumber = _favoriteNumber + 10;
    }
}