// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract testPertamaCuy {
    string public textIki;
    address public owner;
    uint256 public angka;

    constructor () {
        owner = msg.sender;
    }   

    function setTextIki(string calldata _text) external {
        textIki = _text;
    }

    function increment() external {
        require(msg.sender == owner, "You aren't the owner"); // cuman yang punya yang boleh manggil
        angka++;
    }

    function getPemilik () public view returns (address){
        return owner; // bukan dari params tapi component paling atas
    }

}