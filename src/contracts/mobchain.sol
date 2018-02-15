pragma solidity ^0.4.16;

import "./mobcoin.sol"
import "./reptoken.sol"
import "./sustoken.sol"

contract Mobchain {
struct user {
    uint256 addressLender;
    bool busy;
}
struct lender {
    uint256 carPosition;
    uint256 carCondition;
    bool available;
    uint256 addressPreuser;
    bool carType;    
}
struct account {
    user carUser;
    lender carLender;
} 

function Mobchain public {

} 

mapping(address => account) accounts;

function expectedCost()



}