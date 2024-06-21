// SPDX-License-Identifier: MITD
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";

// https://eth-mainnet.g.alchemy.com/v2/tDaFss9L7G5E6Q0z6kBkc26gUU5MGmY3

interface IWETH {
    function balanceOf(address) external view returns (uint256);
    function deposit() external payable;
}

contract TestFork is Test {

    IWETH public weth;

    function setUp() public {
        weth = IWETH(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
    }

    function testDeposit() external {
        uint256 balBefore = weth.balanceOf(address(this));
        console.log("balance before : ", balBefore);

        weth.deposit{value: 100}();

        uint256 balAfter = weth.balanceOf(address(this));
        console.log("balance After : ", balAfter);

    }
}