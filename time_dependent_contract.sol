pragma solidity 0.5.1;

contract MyContract {
    uint256 public peopleCount;
    mapping(uint => Person) public people; // people is a public array of Person type
    
    uint256 openingTime = 1620396986;

    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime);
        _;
    }
    
    struct Person { // Person structure
        uint _id;
        string _firstName;
        string _lastName;
    }
    
    function addPerson(
        string memory _firstName, 
        string memory _lastName
    ) 
        public 
        onlyWhileOpen 
    {
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }
    
    function incrementCount() internal { // to use this function inside other functions
        peopleCount += 1;
    }
}
