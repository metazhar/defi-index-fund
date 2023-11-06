// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// This contract contains the list of DAO members and allows proposals
//  to be submitted, viewed, and voted upon

contract DAOManager {
    struct Index {
        string name;
        string[] cryptos;
        uint256[] weights;
    }

    address[] public members;
    Index[] public indexProposals;

    function addMember(address member) public {
        members.push(member);
    }

    function removeMember(address member) public {
        for (uint256 i = 0; i < members.length; i++) {
            if (members[i] == member) {
                members[i] = members[members.length - 1];
                members.pop();
                break;
            }
        }
    }

    function getMembers() public view returns (address[] memory) {
        return members;
    }

    function listMembers() public view returns (address[] memory) {
        return members;
    }

    function submitIndexProposal(string memory name, string[] memory cryptos, uint256[] memory weights) public {
        require(isMember(msg.sender), "Only DAO members can submit index proposals");
        Index memory newIndex = Index(name, cryptos, weights);
        indexProposals.push(newIndex);
    }

    function getIndexProposals() public view returns (Index[] memory) {
        return indexProposals;
    }

    function isMember(address member) public view returns (bool) {
        for (uint256 i = 0; i < members.length; i++) {
            if (members[i] == member) {
                return true;
            }
        }
        return false;
    }
}
