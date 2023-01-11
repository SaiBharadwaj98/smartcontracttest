// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
//inheritence - tranfer the properties of a contract
// parent contract -> child contract
contract animal{
    //state variables - private | public | internal
    uint256 public limbs; 
    string public habitat; //only access within the contract
    string public name;
    string public foodChoice;
    uint256 public lifeExpt;


    //functions - private | public | internal | external
    function addLimbs(uint256 _limbs) public{
        limbs = _limbs;
    }
    function addhabitat(string memory _habitat) public{
        habitat = _habitat;
    }
    function addName(string memory _name) public{
        name = _name;
    }
    function addFoodChoice(string memory _foodChoice) public{
        foodChoice = _foodChoice;
    }
    function addlifeExpt(uint256 _lifeExpt) public{
        lifeExpt = _lifeExpt;
    }
}

contract dog is animal{
    string breed;


    function addbreed(string memory _breed) public{

        breed = _breed;
    }

    function displayHabitat() public view returns(string memory){
        return habitat;
    }
}

contract pug is dog{

}

contract cat is animal{

}
