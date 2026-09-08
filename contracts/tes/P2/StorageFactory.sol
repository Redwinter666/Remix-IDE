// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorage = new SimpleStorage();
        simpleStorageArray.push(newSimpleStorage);
    }

    function sfStorage(uint256 _simpleStorageIndex, uint256 simpleStorageNumber) public {
    SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
    simpleStorage.store(simpleStorageNumber);
    }

    function sfGetStore(uint256 simpleStorageIndex) public view returns (uint256) {
    SimpleStorage simpleStorage = simpleStorageArray[simpleStorageIndex];
    return simpleStorage.retrieve();
    }
}