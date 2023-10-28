// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./DAOManager.sol";

contract IndexConstruction {
    DAOManager public daoManager;
    Proposal[] public proposals;
    address public admin = msg.sender;

    constructor(address _daoManager) {
        daoManager = DAOManager(_daoManager);
    }

    struct Proposal {
        address[] assets;
        uint256[] weights;
        uint256 votes;
        bool active;
    }

    function proposeIndex(address[] memory assets, uint256[] memory weights) public {
        // Validate weights and assets length

        proposals.push(Proposal({assets: assets, weights: weights, votes: 0, active: false}));
    }

    function voteForProposal(uint256 proposalId) public {
        // Logic to vote for a proposal
        // For demonstration:
        proposals[proposalId].votes += 1;
    }

    function submitIndexProposal(string memory name, string[] memory cryptos, uint256[] memory weights) public {
        daoManager.submitIndexProposal(name, cryptos, weights);
    }

    function getIndexProposals() public view returns (DAOManager.Index[] memory) {
        return daoManager.getIndexProposals();
    }
}
