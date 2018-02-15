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

address userAddress;
mapping(address => account) accounts;

function expectedCost(int256 distance, int256 additionalCost) public returns(int256) {
    userAddress = msg.sender;
    int256 distancePrice = 1;
    int256 cost = distance * distancePrice;
    int256 discountFactor = getDiscount();
    int256 expCost = cost * discountFactor / 100000 + additionalCost;
    int256 mobBalance = 10000; //
    if (mobBalance < expCost) {
        return (-1);
    }
    else {
        return (expCost);
    } 
}

function getDiscount() public pure returns(int256) {
    //RepToken.balanceOf(userAddress) * 1000;
    //SusToken.balanceOf(userAddress);
    int256 repBalance = 50000;
    int256 susBalance = 100000;
    int256 discountFactor = 12000 -repBalance / 100 * 20 -susBalance / 100 * 20;
    return (discountFactor);
}



}