// SPDX-License-Identifier: MIT

pragma solidity ^0.6.6;

contract flowcontrol{

    function whichday(uint256 _day) public pure returns(string memory){
        if(_day == 1){
            return "Sunday";
        }else if(_day == 2){
            return "Monday";
        }else if(_day == 3){
            return "Tuesday";
        }else if(_day == 4){
            return "Wednesday";
        }else if(_day == 5){
            return "Thursday";
        }else if(_day == 6){
            return "Friday";
        }else if(_day == 7){
            return "Saturday";
        }
        return "only 7 days";
    }
        
    
}
