// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract DataStore1 {
    uint256 public savedData;

 
    function storeData(uint256 _data) public {
        savedData = _data;
    }

    
    function doSomething() public virtual returns (string memory) {
        return "Ini fungsi doSomething dari contract induk (DataStore1)";
    }
}


contract DataStore2 is DataStore1 {
    
    
    function readData() public view returns (uint256) {
        return savedData; // Bisa langsung baca karena mewarisi DataStore1
    }

   
    function doSomething() pure public override returns (string memory) {
        return "Ini fungsi doSomething yang sudah di-override di contract turunan (DataStore2)";
    }
}