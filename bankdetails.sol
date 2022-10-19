// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract Bankstructcontract{

    struct user{

        string name;
        string Branch;
        string IFSCcode;
        uint8 age;
        uint256 AccNumber;
        
    }
    struct Bank{
        user Bankuser;

    }
    user public user1;
    user public user2;

    function Adduser() public{
        user1 = user("Bhardwaj","Hyderabad","INDB111100",24, 123456790);
        user2 = user("Sai","Delhi","INDB223300",25,98765432);
    }

    user[] public userlist; // 'array' or 'list' both are same in solidity
        uint[] var1;

        function _Adduser(
        string memory _name,
        string memory _Branch,
        string memory _IFSCcode,
        uint8 _age,
        uint256 _AccNumber) public{

            userlist.push(user(_name,_Branch,_IFSCcode,_age,_AccNumber));
        }
        function getdetails(uint _AccNumber) public view returns(user memory){

            for(uint i=0; i<userlist.length;i++){
                if(userlist[i].AccNumber == _AccNumber){
                    return userlist[i];
                }
            }
            return user("","","",0,0);
        }
}
