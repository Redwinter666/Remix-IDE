// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VaultBase {
    function getVaultName() public pure virtual returns (string memory) {
        return "Vault Dasar";
    }
}

contract StudentVault is VaultBase {
    struct Penabung {
        address userAddress;
        string nama;
        uint256 jumlahETH;
        uint256 timestamp;
    }

    Penabung[] public daftarPenabung;
    mapping(address => uint256) public totalTabungan;
    uint256 public constant ETH_TO_IDR = 50000000;

    function getVaultName() public pure override returns (string memory) {
        return "Student Vault-Tabungan Mahasiswa";
    }

    function deposit(string memory _nama) public payable {
        require(msg.value > 0, "Nilai ETH harus lebih besar dari 0");
        totalTabungan[msg.sender] += msg.value;
        daftarPenabung.push(Penabung({
            userAddress: msg.sender,
            nama: _nama,
            jumlahETH: msg.value,
            timestamp: block.timestamp
        }));
    }

    function getSaldoDalamIDR(address _user) public view returns (uint256) {
        return (totalTabungan[_user] * ETH_TO_IDR) / 1e18;
    }
}