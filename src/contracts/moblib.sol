pragma solidity ^0.4.16;

library MobLib {

    function max(int8 a, int8 b) public pure returns (int8) {
       return a > b ? a : b;
    }

    function min(int8 a, int8 b) public pure returns (int8) {
       return a < b ? a : b;
    }
}
