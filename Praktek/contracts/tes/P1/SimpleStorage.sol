// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    // Tipe Data Dasar
    uint256 my_integer = 10;
    bool my_boolean = true;
    string my_string = "hello world!";
    address my_address = 0x5077fF71E0e73CcF3fD6023e056c08d21D9AD424;
    bytes my_bytes = "hello world!";

    uint256 public favoriteNumber;

    // Struct
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People public person = People({favoriteNumber: 2, name: "Patrik"});

    // Array Dinamis untuk Struct
    People[] public people;

    // Fungsi untuk menyimpan angka favorit
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // Fungsi untuk menambahkan data ke array people
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
    }
}