// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";
import {stdError} from "forge-std/Test.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    function test_Increment() public {
        counter.inc();
        assertEq(counter.count(), 1);
    }

    function testDecUnderFlow() public {
        vm.expectRevert(stdError.arithmeticError);
        counter.dec();
    }

   // function testFail() public {        // prefix with test (foundry expected to pass) 
   //    counter.inc();                  // prefix with testFail (foundry expected to fail)
   // }

    function test_Decrement() public {
        counter.inc();
        counter.inc();
        counter.dec();
        assertEq(counter.count(), 1);
    }
}


// Note :- Everytime when each function call , it start with new contract instence for each function. 