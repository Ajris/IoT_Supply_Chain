pragma solidity ^0.6.0;

contract SPToken {
    address public owner;
    mapping (address => uint) public balances;

    event Sent(address from, address to, uint amount);

    constructor(uint _initialAmount) public {
        owner = msg.sender;
	balances[owner] = _initialAmount;
    }

    function transfer(address receiver, uint amount) public {
        if (balances[msg.sender] < amount) return;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }

    function balanceOf(address account) public returns (uint) {
        return balances[account];
    }
}
