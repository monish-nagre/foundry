// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";     // 1st add Test.sol in test file
import {HelloWorld} from "../src/HelloWorld.sol";     // add contract file to access the functions 

contract HelloWorldTest is Test {
    HelloWorld public helloWorld;

    function setUp() public {
        helloWorld = new HelloWorld();    // replica contract 
    }

    function testGreet() view  public {
        assertEq(helloWorld.greet(),"Hello World!");
    }
}


// Terminal command : forge test --match-path test/Counter.t.sol -vvvv