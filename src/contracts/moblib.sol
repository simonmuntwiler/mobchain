pragma solidity ^0.4.16;

library MobLib {

    function max(int16 a, int16 b) public pure returns (int16) {
       return a > b ? a : b;
    }

    function min(int16 a, int16 b) public pure returns (int16) {
       return a < b ? a : b;
    }
}
