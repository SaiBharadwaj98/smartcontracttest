// Solidity program to
// demonstrate addition
pragma solidity 0.6.6;
contract basicMath
{
	// Declaring the state
	// variables
	uint firstNo ;
	uint secondNo ;

	// Defining the function
	// to set the value of the
	// first variable
	function firstNoSet(uint x) public
	{
		firstNo = x;
	}

	// Defining the function
	// to set the value of the
	// second variable
	function secondNoSet(uint y) public
	{
		secondNo = y;
	}

	// Defining the function
	// to add the two variables
	function add() view public returns (uint)
	{
		uint Sum = firstNo + secondNo ;
		
		// Sum of two variables
		return Sum;
	}

    function add(uint256 a, uint256 b) public pure returns(uint256){
        uint256 c=a+b;
        return c;
    }
    function sub(int256 a, int256 b) public pure returns(int256){
        int256 c=a-b;
        return c;
    }
    function multiplication(uint256 a, uint256 b) public pure returns(uint256){
        uint256 c=a*b;
        return c;
    }
    function division(uint256 a, uint256 b) public pure returns(uint256){
        uint256 c=a/b;
        return c;
    }
    function modulous(uint256 a, uint256 b) public pure returns(uint256){
        uint256 c=a % b;
        return c;
    }
}
