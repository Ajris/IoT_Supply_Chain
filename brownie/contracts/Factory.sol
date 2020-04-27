pragma solidity ^0.6.0;

import './Good.sol';

contract Factory {
    address public good;

    constructor(address _good) public {
        good = _good;
    }

    function produce(address receiver, uint amount) public {
        Good(good).mint(receiver, amount);
    }
}
