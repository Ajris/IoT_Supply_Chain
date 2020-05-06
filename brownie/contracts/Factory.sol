pragma solidity ^0.6.0;

import './Good.sol';

contract Factory {
    address public good;
    address public manager; 
    uint price; 
    
    struct Order {
        uint id;
        uint amount;
        uint price;
        address payable customer;
        OrderStatus status;
    }
    
    enum OrderStatus {
        PROCESSING, PAYED, CANCELLED, REALIZED
    }
    
    mapping(uint => Order) orders;    
    uint order_id = 0;

    constructor(address _manager, address _good) public {
        manager = _manager;
	    good = _good;
    }

    function produce(uint amount) public {
	    require(manager == msg.sender, "Only manager");
	    Good(good).mint(address(this), amount);
    }

    function set_price(uint _price) public {
	    require(manager == msg.sender, "Only manager");
	    price = price;
    }

    function order(uint amount) public returns (uint) {
       	order_id++;
    	orders[order_id] = Order(order_id, amount, price, msg.sender, OrderStatus.PROCESSING);
    	return order_id;
    }

    function cancel_order(uint id) public {
	    require(orders[id].customer == msg.sender, "Only customer");
        require(orders[id].status != OrderStatus.REALIZED, "Status cannot be realized");
	if(orders[id].status == OrderStatus.PAYED) {
		orders[id].customer.send(orders[id].amount*orders[id].price);
	}
	orders[id].status = OrderStatus.CANCELLED;
    }

    function pay_order(uint id) public payable {
	    require(orders[id].customer == msg.sender, "Only customer");
        require(orders[id].status == OrderStatus.PROCESSING, "Status must be processing");
        Order storage o = orders[id];
        uint required = o.amount*o.price;
        if(msg.value < required) return;
        o.status = OrderStatus.PAYED;
    }

    function realize_order(uint id) public {
	    require(manager == msg.sender, "Only manager");
        require(orders[id].status == OrderStatus.PAYED, "Status must be payed");
        Order storage o = orders[id];
        Good(good).good_transfer(o.customer, o.amount);
        o.status = OrderStatus.REALIZED;
    }
}
