pragma solidity ^0.6.0;

contract Good {
    mapping (address => uint) public good_balances;
    string public name;

    constructor(string memory _name) public {
	name = _name;
    }

    function mint(address owner, uint amount) public {
        good_balances[owner] += amount;      
    }

    function good_transfer(address receiver, uint amount) public {
        if (good_balances[msg.sender] < amount) return;
        good_balances[msg.sender] -= amount;
        good_balances[receiver] += amount;
    }

    function good_balance() public returns (uint) {
        return good_balances[msg.sender];
    }

    function good_balanceOf(address account) public returns (uint) {
        return good_balances[account];
    }
}
