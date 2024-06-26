// SPDX-License-Identifier: MITD
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";


contract InvariantIntro {

    bool public flag;   // default : false 

    function func_1() external {}
    function func_2() external {}
    function func_3() external {}
    function func_4() external {}
    function func_5() external {
        flag = true;
    }

}


contract TestInvariants is Test {

    InvariantIntro public target;

    function setUp() public {
        target = new InvariantIntro();
    }

    function invariant_flag_is_always_false() view external {
        assertEq(target.flag(), false);
    }
}


// difference between fuzz & invariants : 
// fuzz : check perticular function with random input 
// invariants : check all functions with random sequenes with random input