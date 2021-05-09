pragma solidity ^0.6.0;

contract Mappings {
    uint[] public uintArray = [1,2,3,4];
    string[] public stringArray = ["apple","banana","carrot"];
    string[] public updatable_array;
    uint[][] public array2D = [[1,2,3],[4,5,6]];
    
    function addValue(string memory _value) public {
        updatable_array.push(_value);
    }
    
    function valueCount() public view returns (uint) {
        return updatable_array.length;
    }
}
