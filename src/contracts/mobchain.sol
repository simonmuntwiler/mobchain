pragma solidity ^0.4.1;

import  "./mobcoin.sol";
import  "./reptoken.sol";
import  "./sustoken.sol";

contract MobChain {
    struct User {
        address addressLender;
        bool busy;
    }
    struct Lender {
        uint256 carPosition;
        uint8 carCondition;
        bool available;
        address addressPreuser;
        bool carType;    
    }
    struct Account {
        string name;
        User carUser;
        Lender carLender;
    }

    //Account[] accounts;
    mapping(address => Account) accounts;
    address mobcoinAddress;
    address reptokenAddress;
    address sustokenAddress;
    
    function MobChain() public {
        mobcoinAddress = new MobCoin();
        reptokenAddress = new RepToken();
        sustokenAddress = new SusToken();

    }

    function addUser(string _name, bool _carType) payable public {

        require(msg.value > 0.25 ether);
        accounts[msg.sender].name = _name;
        accounts[msg.sender].carLender.carType = _carType;
        accounts[msg.sender].carLender.available = true;

        //give mobcoins to user
        MobCoin mobcoin = MobCoin(mobcoinAddress);
        mobcoin.transfer(msg.sender, msg.value * 1000);

    }

    function expectedCost(int256 distance, int256 additionalCost) public returns(int256) {
        userAddress = msg.sender;
        expCost = getCost(int256 distance, int256 additionalCost);
        accounts[userAddress].carUser.expCost = expCost;
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
    address lenderAddress = accounts[userAddress].carUser.lenderAddress;
    address preuserAddress = accounts[lenderAddress].carLender.preuserAddress;
    require(preuserAddress != 0x0)
    if (carCondition < accounts[lenderAddress].carLender.carCondition) {
        //lower trust coins 
    }
    else {
        //increase trust coins
    }
    accounts[lenderAddress].carLender.preuserAddress = 0x0;
    accounts[lenderAddress].carLender.carCondition = carCondition;
}

function arrive() public pure returns(int256) {

    require(accounts[userAddress].carUser.busy == 0);
    accounts[userAddress].carUser.busy = 1;
    accounts[accounts[userAddress].carUser.addressLender].carLender.available = 0;

    int256 finalCost = accounts[userAddress].carUser.expCost;

    //transfer final cost from user to lender
    MobCoin mobcoin = MobCoin(mobcoinAddress);
    mobcoin.transfer(accounts[msg.sender].carUser.addressLender, finalCost);

    //update sustainability
    if accounts[accounts[userAddress].carUser.addressLender].carLender.carType == 1 {
        SusToken sustoken = SusToken(sustokenAddress);
        sustoken.update(msg.sender, );  
   
   
   };//1 is electr.car

    accounts[accounts[userAddress].carUser.addressLender].carLender.available = 1;
    accounts[userAddress].carLender.preuser = userAddress; 
    accounts[userAddress].carUser.busy = 0;
    return (finalCost);
   
}

}