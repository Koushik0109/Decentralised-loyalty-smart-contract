pragma solidity ^0.8.0;

contract LoyaltyProgram {
    struct Reward {
        address owner;
        string name;
        string description;
        uint256 points;
        uint256 tokenId;
    }
    mapping(uint256 => Reward) public rewards;
    mapping(address => mapping(uint256 => bool)) public rewardOwnership;
    uint256 public nextRewardId;
    event NewReward(uint256 rewardId, address creator, string name, string description, uint256 points);
    event RewardTransfer(uint256 rewardId, address from, address to);

    constructor() public {
        nextRewardId = 0;
    }

    function createReward(string memory _name, string memory _description, uint256 _points) public {
        require(_points > 0, "Points should be greater than 0.");
        rewards[nextRewardId] = Reward(msg.sender, _name, _description, _points, nextRewardId);
        rewardOwnership[msg.sender][nextRewardId] = true;
        emit NewReward(nextRewardId, msg.sender, _name, _description, _points);
        nextRewardId++;
    }

    function earnPoints(address _user, uint256 _points) public {
        require(_points > 0, "Points should be greater than 0.");
        rewards[nextRewardId] = Reward(_user, _points);
        nextRewardId++;
    }

        function redeemReward(uint256 _rewardId) public {
        require(rewardOwnership[msg.sender][_rewardId], "You don't have enough points to redeem this reward.");
        rewards[_rewardId].owner = msg.sender;
        emit RewardTransfer(_rewardId, rewards[_rewardId].owner, msg.sender);
    }
function transferReward(address _to, uint256 _rewardId) public {
    require(rewardOwnership[msg.sender][_rewardId], "You don't have the ownership of this reward.");
    rewardOwnership[msg.sender][_rewardId] = false;
    rewardOwnership[_to][_rewardId] = true;
    rewards[_rewardId].owner = _to;
    emit RewardTransfer(_rewardId, msg.sender, _to);
}

function getReward(uint256 _rewardId) public view returns (address, string memory, string memory, uint256) {
    return (rewards[_rewardId].owner, rewards[_rewardId].name, rewards[_rewardId].description, rewards[_rewardId].points);
}


