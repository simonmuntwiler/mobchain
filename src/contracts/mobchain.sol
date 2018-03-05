pragma solidity ^0.4.1;

import  "./mobcoin.sol";
import  "./reptoken.sol";
import  "./sustoken.sol";

contract MobChain {
    struct User {
        address addressLender;
        bool busy;
        uint256 expCost;
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

    mapping(address => Account) accounts;
    MobCoin public mobcoin;
    RepToken reptoken;
    SusToken sustoken;
    address[] public userA;

    address bankAddress = this;
    
    function MobChain() public {
        mobcoin = new MobCoin();
        reptoken = new RepToken();
        sustoken = new SusToken();

    }

    function addUser(string _name, bool _carType) payable public {
        //for now dont user ether
        //require(msg.value >= 0.25 ether);
        accounts[msg.sender].name = _name;
        accounts[msg.sender].carLender.carType = _carType;
        accounts[msg.sender].carLender.available = true;
        accounts[msg.sender].carUser.busy = false;

        //give mobcoins to user
        //mobcoin.transferFrom(bankAddress,msg.sender, msg.value * 1000);
        mobcoin.transferFrom(bankAddress,msg.sender, (0.25 ether) * 1000); //remove this when paying works

        //initialize reptokens and sustokens to 50
        reptoken.update(msg.sender,50);
        sustoken.update(msg.sender,50);

        userA.push(msg.sender);

    }
    
    function numUser() public returns(uint256) {
        return userA.length;
    }

    function getBankBalance() public view returns (uint256 _balance) {
        _balance = mobcoin.getBalance(bankAddress);
    }

    function getUserBalance() public view returns (uint256 _balance) {
        _balance = mobcoin.getBalance(msg.sender);
    }

    function getUserName(address addr) public view returns (string _name) {
        return accounts[addr].name;
    }

    function getUserRep() public view returns (int16 _reputation) {
        _reputation = reptoken.getBalance(msg.sender);
    }

    function getUserSus() public view returns (int16 _sus) {
        _sus = sustoken.getBalance(msg.sender);
    }

    function carRequest(uint256 distance, uint256 additionalCost, address addressLender) public view returns(int256) {
        uint256 expCost = getCost(distance, additionalCost);
        uint256 mobBalance = mobcoin.getBalance(msg.sender);
        
        if (mobBalance < expCost) {
            return (-1);
        } else {
            accounts[msg.sender].carUser.expCost = expCost;
            accounts[msg.sender].carUser.addressLender = addressLender;
            return (int256(expCost));
        } 
    }

    function getCost(uint256 distance, uint256 additionalCost) public view returns(uint256) {
        uint256 distancePrice = 10 ** uint256(18);
        uint256 cost = distance * distancePrice;
        uint256 discountFactor = getDiscount();
        uint256 expCost = cost * discountFactor / 100000 + additionalCost * 10 ** uint256(18);
        return (expCost);
    }

    function getDiscount() public view returns(uint256) {
        uint256 repBalance = uint256(reptoken.getBalance(msg.sender)) * 1000;
        uint256 susBalance = uint256(sustoken.getBalance(msg.sender)) * 1000;
        uint256 discountFactor = 120000 - repBalance / 100 * 20 - susBalance / 100 * 20;
        return (discountFactor);
    }

    function rate(uint8 carCondition,address addressLender,address addressPreuser) public {
        require(addressPreuser != 0x0);
        if (carCondition < accounts[addressLender].carLender.carCondition) {
            reptoken.update(addressPreuser, -5);
        } else {
            reptoken.update(addressPreuser, 1);
        }

        accounts[addressLender].carLender.addressPreuser = 0x0;
        accounts[addressLender].carLender.carCondition = carCondition;
    }

    function arrive(uint256 distance, uint256 additionalCost, address addressLender) public returns(uint256) {
        require(accounts[msg.sender].carUser.busy == false);
        accounts[msg.sender].carUser.busy = true;

        accounts[addressLender].carLender.available = false;

        uint256 finalCost = getCost(distance, additionalCost);

        //transfer final cost from user to lender
        mobcoin.transferFrom(msg.sender,addressLender, finalCost);

        //update sustainability
        if (accounts[addressLender].carLender.carType == true) { //1 is electr.car
        sustoken.update(msg.sender, 5); 
        } else {
        sustoken.update(msg.sender, -5); 
        }

        accounts[addressLender].carLender.available = true;
        accounts[msg.sender].carUser.busy = false;
        return (finalCost);
    }

}