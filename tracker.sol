//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract Trackproduct{
    //model the product
    //functions for handling the product
    //manage ownership
    //events to notify of changes
    address public owner;

    //product Status
    enum Status{
        en_route, //0
        delivered, //1
        packing, //2
        shippeed, //3
        cancelled //4
    }
    //product model
    struct product{
        string name;
        string brand;
        string MFD;
        uint8 MRP;
        string expdate;
        bool coldspace;
        uint8 temp;
        string currentLoc;
        Status productStatus;
    }
    //product mapping
    mapping(uint256 => product) public productMap;
    mapping(uint256 => address) public productOwnership;
    //events
    event locationUpdateEvent(uint256 productID, string location);
    event tempUpdateEvent(uint256 productID, uint8 temp);
    event newProductEvent(uint256 productID, string name);
    //functions
    function addProduct(
        uint256 _productID,
        string memory _name,
        string memory _brand,
        string memory _MFD,
        uint8 _MRP,
        string memory _expdate,
        bool _coldStorage,
        uint8 _temp,
        string memory _currentLoc,
        Status _productStatus
    ) public{
        productMap[_productID] = product(
        _name,_brand,_MFD,_MRP,_expdate,_coldStorage,_temp,_currentLoc,_productStatus
        );

        productOwnership[_productID] = msg.sender;
        emit newProductEvent(_productID,_name);

    }
    function viewproductDetails(uint256 _productID) public view returns(product memory){
        return productMap[_productID];
    }
    function updateLocation(uint256 _productID , string memory _newLocation) isOwner(_productID) public{
        product memory productDetails = productMap[_productID];
        productDetails.currentLoc = _newLocation;
        productMap[_productID] = productDetails;
        emit locationUpdateEvent(_productID,_newLocation);
    }
    function updateTemp(uint256 _productID , uint8 _newTemp) isOwner(_productID) public{
        product memory productDetails = productMap[_productID];
        productDetails.temp = _newTemp;
        productMap[_productID] = productDetails;
        emit tempUpdateEvent(_productID,_newTemp);
    }
        function updateStatus(uint256 _productID , Status _productStatus) isOwner(_productID) public{
        product memory productDetails = productMap[_productID];
        productDetails.productStatus = _productStatus;
        productMap[_productID] = productDetails;

    }

    function deleteProduct(uint256 _productID) public isOwner(_productID) {
        delete productMap[_productID];
        delete productOwnership[_productID];
    }
    modifier isOwner(uint256 _productID){
        require(productOwnership[_productID] == msg.sender,"only owners can make change to the product");
        _;
    }
}
