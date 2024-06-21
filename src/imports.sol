// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

// Test import openzeppelin
import "@openzeppelin/contracts/access/Ownable.sol";     // remappings for import library

contract TestOZ is Ownable {
    constructor() Ownable(msg.sender) {}
}