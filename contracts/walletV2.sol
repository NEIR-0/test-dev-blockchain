// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract SimpleWallet {
    mapping(address => uint256) private balances;

    // Function to deposit Ether into the user's account
    function deposit() public payable {
        require(msg.value > 0, "Must deposit a positive amount of Ether");
        balances[msg.sender] += msg.value; // msg.value is in Wei
    }

    // Function to withdraw the user's own Ether
    function withdraw(uint256 amountInEther) public {
        uint256 amountInWei = amountInEther * 1 ether; // Convert Ether to Wei
        require(balances[msg.sender] >= amountInWei, "Insufficient balance");
        balances[msg.sender] -= amountInWei;
        payable(msg.sender).transfer(amountInWei);
    }

    // Function to check the user's balance in Ether
    function checkBalance() public view returns (uint256) {
        return balances[msg.sender] / 1 ether; // Convert Wei to Ether for display
    }
}