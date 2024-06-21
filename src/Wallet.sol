// SPDX-License-Identifier: MITD
pragma solidity ^0.8.13;

contract Wallet {

    address payable public owner;

    event Deposit(address account, uint256 amount);

    constructor() payable {
        owner = payable(msg.sender);
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    } 

   function withdraw(uint256 _amount) external {
        require(msg.sender == owner,"Not an owner");
        payable(msg.sender).transfer(_amount);
   }

   function setOwner(address _owner) external {
        require(msg.sender == owner,"Not an Owner");
        owner = payable(_owner);
   }
    
}