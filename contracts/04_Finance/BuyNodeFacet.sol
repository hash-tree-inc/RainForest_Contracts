// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {AppStorage, Modifiers, LibAppStorage} from "../shared/libraries/LibAppStorage.sol";

contract Node is Modifiers {
    // function buyNode() external payable {
    //     AppStorage storage s = LibAppStorage.diamondStorage();
    //     require(msg.value == s.nodePrice, "RainForest: incorrect amount");
    //     s.nodePrice = s.nodePrice * 2;
    //     s.nodeCount = s.nodeCount + 1;
    //     s.nodeOwner[msg.sender] = true;
    //     s.nodeOwnerList.push(msg.sender);
    // }

    // function getNodePrice() external view returns (uint256) {
    //     AppStorage storage s = LibAppStorage.diamondStorage();
    //     return s.nodePrice;
    // }

    // function getNodeCount() external view returns (uint256) {
    //     AppStorage storage s = LibAppStorage.diamondStorage();
    //     return s.nodeCount;
    // }

    // function getNodeOwnerList() external view returns (address[] memory) {
    //     AppStorage storage s = LibAppStorage.diamondStorage();
    //     return s.nodeOwnerList;
    // }

    // function getNodeOwner(address _owner) external view returns (bool) {
    //     AppStorage storage s = LibAppStorage.diamondStorage();
    //     return s.nodeOwner[_owner];
    // }
}