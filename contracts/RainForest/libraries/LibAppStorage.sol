// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {LibDiamond} from "../../shared/libraries/LibDiamond.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";


struct User {
    string userNickName;
    address userAddr;
}

struct UserOwnedContract {
    address userAddr;
    address[] erc20Lists;
    address[] erc721Lists;
    address[] erc1155Lists;
}

/**
@dev RainForest는 ERC20의 기능
 */
struct RainForest {
    mapping(address => uint256) _balances;
    mapping(address => mapping(address => uint256)) _allowances;
    uint8 _decimals;
    uint256 _totalSupply;
    string _name;
    string _symbol;
}

/**
@dev Bizardry는 Contract Factory의 기능
 */
struct Bizardry {
    uint erc20LatestVersion;
    uint erc721LatestVersion;
    uint erc1155LatestVersion;
}

struct BizardryImplementation {
    string implementationName;
    address implementationAddress;
    address proxy;
    uint version;
}

struct AppStorage {
    // RainForest State
    RainForest rainForest;
    // Bizardry State
    Bizardry bizardry;
    mapping(uint => BizardryImplementation) ERC20_Impl;
    mapping(uint => BizardryImplementation) ERC721_Impl;
    mapping(uint => BizardryImplementation) ERC1155_Impl;
    mapping(address => UserOwnedContract) userOwnedContracts;

    //
}

library LibAppStorage {
    function diamondStorage() internal pure returns (AppStorage storage ds) {
        assembly {
            ds.slot := 0
        }
    }

    function abs(int256 x) internal pure returns (uint256) {
        return uint256(x >= 0 ? x : -x);
    }
}

/**
@dev global modifier
 */
contract Modifiers {
    AppStorage internal s;

    modifier onlyOwner() {
        LibDiamond.enforceIsContractOwner();
        _;
    }
}
