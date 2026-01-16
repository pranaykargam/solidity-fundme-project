// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SafeMathTester{
    uint8 public bigNumber = 220;

    function add() public{
        bigNumber = bigNumber + 7;
    }
}