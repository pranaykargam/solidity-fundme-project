// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract FallbackExample{

    uint256 public output;

    receive() external payable {
        output = 1;
    }
     fallback() external payable {
        output  = 5;
     }

}