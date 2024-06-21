// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Error} from "../src/Error.sol";

contract TestError is Test {

    Error public err;

    function setUp() public {
        err = new Error();
    }

    function testFailThrowError() view external {
        err.throwError();
    }
                                                        // if we don't want to write testFail , instead of these we use vm.expectRevert in test
    function testRevert() external {
        vm.expectRevert(bytes("not authorized"));
        err.throwError();
    }

    function testCustomError() external {
        vm.expectRevert(Error.NotAuthorized.selector);
        err.throwCustomError();
    }

// label the assertions 
    function testErrorLabel() pure external {
        assertEq(uint256(1), uint256(1),"assert 1");
        assertEq(uint256(1), uint256(1),"assert 2");
        assertEq(uint256(1), uint256(2),"assert 3");
        assertEq(uint256(1), uint256(1),"assert 4");
    }


}