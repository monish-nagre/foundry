// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Error {

    error NotAuthorized();

    function throwError() pure external {
        require(false,"not authorized");
    }

    function throwCustomError() pure external {
        revert NotAuthorized();
    }
}