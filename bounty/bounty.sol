pragma solidity ^0.4.22;

/// @title A stack overflow style question and answer service with bounties.
/// @author Sam Tolmay
contract Bounty {

    event NewQuestion(uint questionId, string title, string body);
    event NewAnswer(uint questionId, uint answerId, string answer);

    address private owner;

    struct Question {
        string title;
        string body;
        string[] answers;
        mapping (uint => address) questionAnswerBy;
        address acceptedAnswer;
    }

    Question[] public questions;
    mapping (uint => address) public questionAskedBy;


    constructor() public {
        owner = msg.sender;
    }

    function askQuestion(string _title, string _body) public returns ( uint ) {
        Question memory q;
        q.title = _title;
        q.body = _body;
        uint id = questions.push(q) -1;
        questionAskedBy[id] = msg.sender;
        emit NewQuestion(id, _title, _body);
        return id;
    }

    function answerQuestion(uint _questionId, string _answer) public {
        Question storage q = questions[_questionId];
        uint answerId;
        answerId = q.answers.push(_answer) - 1;
        q.questionAnswerBy[answerId] = msg.sender;
        emit NewAnswer(_questionId, answerId, _answer);
    }

    function getAnswer(uint _questionId, uint _answerId) public view returns (string) {
        return questions[_questionId].answers[_answerId];
    }

    function acceptAnswer(uint _questionId, uint _answerId) public {
        require(msg.sender == questionAskedBy[_questionId]);
        Question storage q = questions[_questionId];
        q.acceptedAnswer = q.questionAnswerBy[_answerId];
    }

}
