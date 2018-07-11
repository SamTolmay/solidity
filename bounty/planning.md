# Cloneoverflow

A smart contract to implement a stackoverflow type question and answer service.
Question posters should be able to post a bounty with their question, which can then be claimed by the respondent if their answer is accepted

### Entities

##### User

Properties:
- address
- name
- balance
- upvotes
- has many questions
- has many answers

Methods
- ask question
- change bounty on question
- accept answer
- answer question
- withdraw bounty
- upvote question/answers

##### Question

Properties:
- poster
- title
- body
- bounty
- bounty time before can be reclaimed
- upvotes
- has many answers

##### Answer

Properties:
- respondent
- body
- accepted
- upvotes
