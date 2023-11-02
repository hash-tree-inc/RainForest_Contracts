// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {LibDiamond} from "../libraries/LibDiamond.sol";
import "../storage/facets/AppStorageFacet.sol";

contract BizardryFacet is AppStorageFacet {
    function addUser(address _addr) external {
        AppStorage storage s = appStorage();

        s.users[_addr]._userAddr = _addr;
    }

    function getUser(address _addr) external view returns (address) {
        AppStorage storage s = appStorage();

        return s.users[_addr]._userAddr;
    }
}
