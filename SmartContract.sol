// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract smartContract{

    uint256 private  balance;
    address public  owner;

    constructor(address _owner) payable {
        owner=_owner;
        balance+=msg.value;
    }

    //i receive payouts that come with function
    fallback() external  payable {
        
        balance+=msg.value;
    }
    receive() external  payable {
        balance+=msg.value;
    }

    function getBalance() external  view returns (uint256){
        return  balance;
    }

    function deposit() external payable{
        balance +=msg.value;
    }
    function withdraw(uint256 _amount) external {
        //constraint!!
        require(msg.sender==owner,"You re not authorized.");
        require(balance>=_amount,"Insufficient balance.");
        balance -=_amount;
        payable (owner).transfer(_amount);
    }
}