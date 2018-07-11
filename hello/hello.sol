pragma solidity ^0.4.22;


/// @title A Hello World contract
/// @author Sam Tolmay
contract Hello {

    /// @dev Solidity automatically creates a getter function since we declare this public
    string public message;

    event MessageSet(string newMessage);

    /// @param _message The message to initialise this contract with
    constructor(string _message) public {
        message = _message;
    }

    /// @notice Set the contract's message to a different message
    /// @param _message The message to set the contract message variable to
    function set(string _message) external {
        message = _message;
        emit MessageSet(_message);
    }
}
