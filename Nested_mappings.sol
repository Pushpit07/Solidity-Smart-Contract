pragma solidity ^0.6.0;

contract Mappings {
    mapping(uint => string) public names;
    mapping(uint => Book) public books;
    mapping(address => mapping(uint => Book)) public nestedMapping;
    
    struct Book {
        string title;
        string author;
    }
    
    constructor() public {
        names[1] = "Adam";
        names[2] = "Bruce";
        names[3] = "Carl";
    }
    
    function addBook(uint _id, string memory _title, string memory _author) public {
        books[_id] = Book(_title, _author);
    }
    
    function addMyBook(uint _id, string memory _title, string memory _author) public {
        nestedMapping[msg.sender][_id] = Book(_title, _author);
    }
}
