pragma solidity ^0.5.0;

contract SocialNetwork{
    string public name;
    uint public postCount = 0;
    mapping(uint=>Post) public posts;

    struct Post{
        uint id;
        string content;
        uint tipAmount;
        address author;
    }

    event PostCreated(
        uint id,
        string content,
        uint tipAmount,
        address author
    );

    constructor() public {
        name = "Blockchain Social Network";
    }

    function createPost(string memory _content) public{
        //require valid content
        require(bytes(_content).length>0);
        // increment postcount
        postCount ++;
        // Create the post
        posts[postCount] = Post(postCount,_content,0,msg.sender);
        // Trigger event 
        emit PostCreated(postCount,_content,0,msg.sender);
    }
}