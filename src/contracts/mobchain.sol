pragma solidity ^0.4.16;

import "./mobcoin.sol";
import "./reptoken.sol";
import "./sustoken.sol";

contract Mobchain {
struct user {
    uint256 addressLender;
    bool busy;
    int256 expCost;
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
    expCost = getCost(int256 distance, int256 additionalCost);
    accounts[userAddress].user.expCost = expCost;
    int256 mobBalance = 10000; // read out balance of user
    if (mobBalance < expCost) {
        return (-1);
    }
    else {
        return (expCost);
    } 
}

function getCost(int256 distance, int256 additionalCost) public returns(int256) {
    int256 distancePrice = 1;
    int256 cost = distance * distancePrice;
    int256 discountFactor = getDiscount();
    int256 expCost = cost * discountFactor / 100000 + additionalCost;
    return (expCost);
}

function getDiscount() public pure returns(int256) {
    //RepToken.balanceOf(userAddress) * 1000;
    //SusToken.balanceOf(userAddress);
    int256 repBalance = 50000;
    int256 susBalance = 100000;
    int256 discountFactor = 120000 -repBalance / 100 * 20 -susBalance / 100 * 20;
    return (discountFactor);
}

function rate(uint256 carCondition) public {
    address lenderAddress = accounts[userAddress].user.lenderAddress;
    address preuserAddress = accounts[lenderAddress].lender.preuserAddress;
    require(preuserAddress != 0x0)
    if (carCondition < accounts[lenderAddress].lender.carCondition) {
        //lower trust coins 
    }
    else {
        //increase trust coins
    }
    accounts[lenderAddress].lender.preuserAddress = 0x0;
    accounts[lenderAddress].lender.carCondition = carCondition;
}




}