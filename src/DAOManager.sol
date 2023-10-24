// SPDX License-Identifier: MIT
pragma solidity ^0.8.13;

contract DAOManager {
    address[] public members;

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
}
