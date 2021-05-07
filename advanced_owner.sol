pragma solidity 0.5.1;

contract MyContract {
    uint256 public peopleCount;
    mapping(uint => Person) public people; // people is a public array of Person type
    
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
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
        onlyOwner 
    {
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }
    
    function incrementCount() internal { // to use this function inside other functions
        peopleCount += 1;
    }
}
