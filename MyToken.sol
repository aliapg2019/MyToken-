// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MyToken{

    string public name;
    string public symbol;
    uint public priceToken;
    uint public totalSupply;
    uint8 public decimals;
    address public minter;
    mapping (address => uint) public bances;

    event Transfer(address From_address,address To_address,uint256 amount);

    constructor(uint256 NumSupply){
        minter = msg.sender;
        totalSupply = NumSupply;
        bances[minter] = totalSupply;
        priceToken = 10 ** 12;
        name = "MyToken";
        symbol = "APG";
        decimals = 18;
    }

    modifier Owner(){
        require(minter == msg.sender,"Only Minter Can Do It...");
        _;
    }

    function mint(address Reciver, uint amount) public Owner{
        bances[Reciver] += amount;
        totalSupply += amount;
    }

    function TransferToken(address Reciver, uint amount) public {
        require(bances[msg.sender] >= amount,"Not Enugh Token...");
        bances[msg.sender] -= amount;
        bances[Reciver] += amount;
        emit Transfer(msg.sender,Reciver,amount);
    }

}
