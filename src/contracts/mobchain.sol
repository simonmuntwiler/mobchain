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
    address mobcoinAddress;
    address reptokenAddress;
    address sustokenAddress;
    address[] public userA;

    address bankAddress = this;
    
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
        mobcoin.transferFrom(bankAddress,msg.sender, msg.value * 1000);

        //initialize reptokens and sustokens to 50
        RepToken reptoken = RepToken(reptokenAddress);
        reptoken.update(msg.sender,50);
        SusToken sustoken = SusToken(sustokenAddress);
        sustoken.update(msg.sender,50);
        userA.push(msg.sender);

    }
    
    function getUser() public returns(address[]) {
        return userA;
    }


    function getBankBalance() public view returns (uint256 _balance) {
        
        MobCoin mobcoin = MobCoin(mobcoinAddress);
        _balance = mobcoin.getBalance(bankAddress);
    }

    function getUserBalance() public view returns (uint256 _balance) {
        
        MobCoin mobcoin = MobCoin(mobcoinAddress);
        _balance = mobcoin.getBalance(msg.sender);
    }

    function getUserRep() public view returns (int16 _reputation) {

        RepToken reptoken = RepToken(reptokenAddress);
        _reputation = reptoken.getBalance(msg.sender);
    }

    function getUserSus() public view returns (int16 _sus) {

        SusToken sustoken = SusToken(sustokenAddress);
        _sus = sustoken.getBalance(msg.sender);
    }

    function expectedCost(uint256 distance, uint256 additionalCost) public view returns(int256) {
        uint256 expCost = getCost(distance, additionalCost);
        accounts[msg.sender].carUser.expCost = expCost;
        MobCoin mobcoin = MobCoin(mobcoinAddress);
        uint256 mobBalance = mobcoin.getBalance(msg.sender);
        
        if (mobBalance < expCost) {
            return (-1);
        } else {
            return (int256(expCost));
        } 
    }

    function getCost(uint256 distance, uint256 additionalCost) public view returns(uint256) {
        uint256 distancePrice = 1;
        uint256 cost = distance * distancePrice;
        uint256 discountFactor = getDiscount();
        uint256 expCost = cost * discountFactor / 100000 + additionalCost;
        return (expCost);
    }

    function getDiscount() public view returns(uint256) {
        RepToken reptoken = RepToken(reptokenAddress);//RepToken.balanceOf(userAddress) * 1000;
        SusToken sustoken = SusToken(sustokenAddress);//SusToken.balanceOf(userAddress);
        uint256 repBalance = uint256(reptoken.getBalance(msg.sender)) * 1000;
        uint256 susBalance = uint256(sustoken.getBalance(msg.sender)) * 1000;
        uint256 discountFactor = 120000 - repBalance / 100 * 20 - susBalance / 100 * 20;
        return (discountFactor);
    }

    function rate(uint8 carCondition) public {
        address addressLender = accounts[msg.sender].carUser.addressLender;
        address addressPreuser = accounts[addressLender].carLender.addressPreuser;
        require(addressPreuser != 0x0);
        RepToken reptoken = RepToken(reptokenAddress);
        if (carCondition < accounts[addressLender].carLender.carCondition) {
            reptoken.update(addressPreuser, -5);
        } else {
            reptoken.update(addressPreuser, 1);
        }

        accounts[addressLender].carLender.addressPreuser = 0x0;
        accounts[addressLender].carLender.carCondition = carCondition;
    }

    function arrive() public view returns(uint256) {
        require(accounts[msg.sender].carUser.busy == false);
        accounts[msg.sender].carUser.busy = true;
        address addressLender = accounts[msg.sender].carUser.addressLender;
        accounts[addressLender].carLender.available = false;

        uint256 finalCost = accounts[msg.sender].carUser.expCost;

        //transfer final cost from user to lender
        MobCoin mobcoin = MobCoin(mobcoinAddress);
        mobcoin.transfer(accounts[msg.sender].carUser.addressLender, finalCost);


        //update sustainability
        SusToken sustoken = SusToken(sustokenAddress);
        if (accounts[accounts[msg.sender].carUser.addressLender].carLender.carType == true) { //1 is electr.car
        sustoken.update(msg.sender, 5); 
        } else {
        sustoken.update(msg.sender, -5); 
        }

        accounts[addressLender].carLender.available = true;
        accounts[addressLender].carLender.addressPreuser = msg.sender; 
        accounts[msg.sender].carUser.busy = false;
        return (finalCost);
    }

}