// SPDX-License-Identifier: MITD
pragma solidity ^0.8.13;

contract Auction {
    uint256 public startAt = block.timestamp + 1 days;
    uint256 public endAt = block.timestamp + 2 days;

    function bid() view external {
        require(
            block.timestamp >= startAt && block.timestamp < endAt, "cannot bid"
        );
    }

    function end() view external {
        require(block.timestamp >= endAt, "cannot end");
    }
}