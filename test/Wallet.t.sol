// SPDX-License-Identifier: MITD
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Wallet} from "../src/Wallet.sol";

// Examples of deal and hoax
// deal(address, uint) - Set balance of address
// hoax(address, uint) - deal + prank, Sets up a prank and set balance

contract AuthTest is Test {

    Wallet public wallet;

    function setUp() public {
        wallet = new Wallet{value: 1e18}();
    }

      // Check how much ETH available for test
    function testLogBalance() view public {
        console.log("ETH balance", address(this).balance / 1e18);
    }

    function _send(uint256 amount) private {
        (bool ok,) = address(wallet).call{value: amount}("");
        require(ok, "send ETH failed");
    }

    function testSendEth() public {
        uint256 bal = address(wallet).balance;

        // deal
        deal(address(1), 100);
        assertEq(address(1).balance, 100);

        deal(address(1), 10);
        assertEq(address(1).balance, 10);

        // hoax = deal + prank
        deal(address(1), 123);
        vm.prank(address(1));
        _send(123);

        hoax(address(1), 456);
        _send(456);

        assertEq(address(wallet).balance, bal + 123 + 456);
    }

    function testSetOwner() external {
        wallet.setOwner(address(1));
        assertEq(wallet.owner(), address(1));
    }

    function testFailSetOwnerAgain() external {
        // msg.sender = address(this)
        wallet.setOwner(address(1));

        vm.startPrank(address(1));     // changes msg.sender to address(1)

        wallet.setOwner(address(1));
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));

        vm.stopPrank(); 

       // msg.sender = address(this)         // fail condition is here 
        wallet.setOwner(address(1));
    }

    
}