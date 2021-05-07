pragma solidity 0.5.1;

contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;
    
    function mint() public {
        balances[tx.origin] ++;
    }
}

contract MyContract {
    address payable wallet;
    address public token;
    
    constructor(address payable _wallet, address _token) public {
        wallet = _wallet;
        token = _token;
    }
    
    function() external payable { // external can only be called outside
        buyToken();
    }
    
    function buyToken() public payable { // 'payable' to accept ether
        ERC20Token _token = ERC20Token(address(token));
        _token.mint();
        wallet.transfer(msg.value);
    }
}
