// SPDX-License-Identifier: MIT

pragma solidity ^0.6.6;

contract sample
{
    uint a;
    uint b;
    
    function firstno(uint x) public{
        a=x;
    } 
     function read1() public view returns(uint)
    {
        return a;
    }
    function secondno(uint y) public{
        b=y;
    }
    function read2() public view returns(uint)
    {
        return b;
    }
    function add() public view returns(uint)
    { 
        return a+b;
    }
}
