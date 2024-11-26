// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract Polling {
    struct Poll {
        string question;
        string[] options;
        mapping(uint256 => uint256) votes; // Maps option index to vote count
        mapping(address => bool) hasVoted;
        bool active;
    }

    Poll[] public polls;

    // Create a new poll
    function createPoll(string memory _question, string[] memory _options) public {
        require(_options.length >= 2, "At least two options are required");

        Poll storage newPoll = polls.push();
        newPoll.question = _question;
        newPoll.options = _options;
        newPoll.active = true;
    }

    // Vote on a poll
    function vote(uint256 pollIndex, uint256 optionIndex) public {
        require(pollIndex < polls.length, "Invalid poll index");
        Poll storage poll = polls[pollIndex];
        require(poll.active, "Poll is not active");
        require(!poll.hasVoted[msg.sender], "You have already voted");
        require(optionIndex < poll.options.length, "Invalid option index");

        poll.votes[optionIndex] += 1;
        poll.hasVoted[msg.sender] = true;
    }

    // Get the number of votes for an option in a poll
    function getVotes(uint256 pollIndex, uint256 optionIndex) public view returns (uint256) {
        require(pollIndex < polls.length, "Invalid poll index");
        require(optionIndex < polls[pollIndex].options.length, "Invalid option index");
        return polls[pollIndex].votes[optionIndex];
    }

    // Close the poll to prevent further voting
    function closePoll(uint256 pollIndex) public {
        require(pollIndex < polls.length, "Invalid poll index");
        Poll storage poll = polls[pollIndex];
        poll.active = false;
    }

    // Get the poll question and options
    function getPoll(uint256 pollIndex) public view returns (string memory, string[] memory) {
        require(pollIndex < polls.length, "Invalid poll index");
        Poll storage poll = polls[pollIndex];
        return (poll.question, poll.options);
    }
}
