pragma solidity ^0.4.16;

contract mobchain {
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



}