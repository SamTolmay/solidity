pragma solidity ^0.4.0;
contract Hello {
    string message;
    constructor(string _message) public {
        message = _message;
    }
    function set(string _message) public {
        message = _message;
    }
    function get() public constant returns (string) {
        return message;
    }
}
