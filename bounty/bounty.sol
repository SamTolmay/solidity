pragma solidity ^0.4.22;

/// @title A stack overflow style question and answer service with bounties.
/// @author Sam Tolmay
contract Bounty {

    address private owner;

    struct Question {
        address poster;
        string title;
        string body;
    }

    struct Answer {
        address respondent;
        string body;
    }

    mapping (uint => address) public questionAskedBy;
    mapping (uint => address) public questionAnsweredBy;
    mapping (uint => uint) public questionAnswersQuestion;

    Question[] public questions;
    Answer[] public answers;

    constructor() public {
        owner = msg.sender;
    }

    function askQuestion(string _title, string _body) public {
        questions.push(Question(msg.sender, _title, _body));

    }

}
