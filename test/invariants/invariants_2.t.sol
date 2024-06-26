// SPDX-License-Identifier: MITD
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {WETH} from "../../src/WETH.sol";

contract Test_WETH_Invariant is Test {

    WETH public weth;

    function setUp() public {
        weth = new WETH();
    }

    function invariant_test() view external {
        assertEq(weth.totalSupply(), 0);
    }
}