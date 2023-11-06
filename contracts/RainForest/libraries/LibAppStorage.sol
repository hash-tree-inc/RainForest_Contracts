// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {LibDiamond} from "../../shared/libraries/LibDiamond.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";


struct RainForest{

}

struct Bizardry {

}


/**
@dev 여기까지 
**/
struct AppStorage {

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
    
    modifier onlyOwner {
        LibDiamond.enforceIsContractOwner();
        _;
    }


}
