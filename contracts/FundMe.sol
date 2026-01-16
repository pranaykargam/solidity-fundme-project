// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;


import {PriceConverter} from "./PriceConverter.sol";


error NotOwner();

contract FundMe {
    using PriceConverter for uint256;
    uint256 public constant MINIMUM_USD = 2;
//783968 without constant
//760707 with constant
    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;



   address public immutable i_owner;
//760695 without immutable
//737464 with immutable
   constructor(){
     i_owner = msg.sender;
   }
    function fund() public payable {
      
        require(msg.value.getConversionRate() >= 10, "Send at least 10 wei");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
        
    }

    function withdraw()public onlyOwner{
        // for loop
        // [1,2,3,4] -> elements
        // 0,1,2,3 -> indexes
        // for (/*starting index,ending index,step[amount*/)
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // reset the array
        funders = new address[](0);
        // actually withdraw the funds
        // transfer
        // payable(msg.sender).transfer(address(this).balance);
        
        // // send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require (sendSuccess, "send failed");

        // call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess,"Call failed");
        revert();
        

    }

    modifier onlyOwner(){
       if(msg.sender != i_owner) { revert NotOwner(); }
        _;  // is a placeholder for the body of the function that uses the modifier.
    }
    

    // what happens if some one send this contract ETH without calling the fund function.

    receive() external payable{
        fund();
    }

    fallback() external payable{
        fund();
    }  
   
}
