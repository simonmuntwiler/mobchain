pragma solidity ^0.4.16;

import {MobLib} from "./moblib.sol";

// interface tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) public; }

contract SusToken {
    // Public variables of the token
    address owner;
    int test;

    // This creates an array with all balances
    mapping (address => int16) public balanceOf;

    /**
     * Constructor function
     */
    function RepToken() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    /**
     * Internal update, only can be called by this contract
     */
    function _update(address _address, int16 _value) internal {
        // Prevent transfer to 0x0 address. Use burn() instead
        require(_address != 0x0);
        // Check if the sender has enough
        balanceOf[_address] = MobLib.max(0, MobLib.min(100, balanceOf[_address]+_value));
        
        // Transfer(_from, _to, _value); ???
    }

    /**
     * Update Sustaintability Score
     */
    function update(address _address, int16 _value) public onlyOwner() {
        _update(_address, _value);
    }
}