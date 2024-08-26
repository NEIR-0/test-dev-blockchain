// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract BlockManager {
    struct Block {
        address creator;
        string message;
    }

    Block[] public blocks;
    address public admin;

    constructor() {
        admin = msg.sender; // The deployer is the admin
    }

    function addBlockAsUser() public {
        blocks.push(Block({
            creator: msg.sender,
            message: "di kirim"
        }));
    }

    function addBlockAsAdmin() public {
        require(msg.sender == admin, "Only admin can add this block");
        blocks.push(Block({
            creator: msg.sender,
            message: "di terima"
        }));
    }

    function getBlockCount() public view returns (uint) {
        return blocks.length;
    }

    function getBlock(uint index) public view returns (address creator, string memory message) {
        require(index < blocks.length, "Index out of bounds");
        Block storage blockInstance = blocks[index];
        return (blockInstance.creator, blockInstance.message);
    }
}