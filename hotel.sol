```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./util.sol";

contract Hotel is utils{

    address payable public ownerAddress;

    //executes the statemets automatically
    //upon contract creation
    constructor(){

        ownerAddress = payable(msg.sender);//global variable
    }
    //enum - enumarated datatype
    //model your options/choices/states

    struct Guests{
        string name;
        uint256 age;
        string dateOfCheckin;
        address userAddress;
    }
    //rooms
    struct Rooms{
        string typeOfRoom;
        uint256 numberOfBeds;
        Availability availability;
        uint256 price;
    }
    //events
    //way to pass info from transaction

    uint[] roomList;

    //assign a unique number to an instance of the Rooms
    mapping(uint256 => Rooms) NumberToRoom;
    mapping(uint256 => Guests) public roomToGuest;
    //mapping(uint256 => mapping(address => Guests)) public roomToGuest;

    //adds a room
    function addRoom(
    uint256 _roomNumber,
    string memory _typeOfRoom, 
    uint256 _numberOfBeds,
    uint256 _price) public isOwner(ownerAddress){
        
        //create an instance of the room
        Rooms memory room = Rooms(_typeOfRoom,_numberOfBeds,Availability.VACANT,_price);
        //map room number to room instance
        NumberToRoom[_roomNumber] = room;
        roomList.push(_roomNumber);
    }
    //get Rooms
    function getRooms() public view returns(uint256[] memory){
        return roomList;
    }
    //room availability
    function getRoomAvailablitity(uint256 _roomNumber) public view returns(string memory){
        if(NumberToRoom[_roomNumber].availability == Availability.BOOKED){
            return "Booked";
        }
        return "vacant";
    }

    //checkin
    function checkin(
        uint256 _roomNumber,
        string memory _name,
        uint256 _age,
        string memory _dateOfCheckin
    ) public payable checkRoomVacant(_roomNumber){
        //pay the owner
        //check the value
        require(msg.value == 1 ether, "The amount should be 1 ether");
        //conduct the transfer
        (bool txnSuccess,) = ownerAddress.call{value: msg.value}("");
        //confirm the transfer
        require(txnSuccess == true,"Transaction failed !");
        emit paymentEvent(msg.sender,msg.value); //logging the data
        //allocate a room
        allocateRoom(_roomNumber,_name,_age,_dateOfCheckin,msg.sender);
        }

    function allocateRoom(
        uint256 _roomNumber,
        string memory _name,
        uint256 _age,
        string memory _dateOfCheckin,
        address _userAddress) private{
                    Guests memory guest = Guests(_name,_age,_dateOfCheckin,_userAddress);
                    roomToGuest[_roomNumber] = guest;
                    NumberToRoom[_roomNumber].availability = Availability.BOOKED;
                    emit roomConfirmEvent("Room is confirmed",_roomNumber,_userAddress);
        }

    //checkout
    function checkout(uint256 _roomNumber) public isOwner(ownerAddress){
        delete roomToGuest[_roomNumber];
        NumberToRoom[_roomNumber].availability = Availability.VACANT;
    }

    //gives you the contract balance
    function getbalance() public view returns(uint){
        return ownerAddress.balance; 
    }

    //modifier to check if the given room is vacant
    modifier checkRoomVacant(uint _number){
        require(NumberToRoom[_number].availability == Availability.VACANT ,"Room is not vacant");
        _; // during execution, this will be replaced with the function statements
    }

}
```

util.sol
