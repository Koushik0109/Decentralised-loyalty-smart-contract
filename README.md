
Decentralized Loyalty Program Smart Contract
A smart contract that allows for the creation of loyalty programs and the use of rewards as NFTs.

Features
Create new rewards
Earn points
Redeem rewards
Transfer rewards
Get details of rewards
How to use
Deploy the smart contract on the Ethereum network
Use a web3 wallet such as MetaMask to interact with the contract
Create new rewards by calling the createReward(string _name, string _description, uint256 _points) function and providing the name, description, and points of the reward.
Earn points by calling the earnPoints(address _user, uint256 _points) function and providing the address of the user and the number of points to be earned.
Redeem rewards by calling the redeemReward(uint256 _rewardId) function and providing the ID of the reward.
Transfer rewards by calling the transferReward(address _to, uint256 _rewardId) function and providing the address of the receiver and the ID of the reward.
Get details of rewards by calling the getReward(uint256 _rewardId) function and providing the ID of the reward.
Events
NewReward: This event is emitted whenever a new reward is created. It stores the details of the reward such as the creator, name, description, and points.
RewardTransfer: This event is emitted whenever a reward is transferred. It stores the details of the transfer such as the reward ID, the previous owner, and the new owner.
