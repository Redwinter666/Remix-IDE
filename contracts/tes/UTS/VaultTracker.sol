// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStudentVault.sol";

contract VaultTracker {
    function cekDataMahasiswa(address _contractAddress, address _mahasiswa) public view returns (uint256 saldoETH, uint256 saldoIDR) {
        StudentVault vault = StudentVault(_contractAddress);
        saldoETH = vault.totalTabungan(_mahasiswa);
        saldoIDR = vault.getSaldoDalamIDR(_mahasiswa);
        return (saldoETH, saldoIDR);
    }
}