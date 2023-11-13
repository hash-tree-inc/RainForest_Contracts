// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {AppStorage, Modifiers, LibAppStorage} from "../libraries/LibAppStorage.sol";
import "../interfaces/IBizardry.sol";
import "@openzeppelin/contracts/proxy/beacon/BeaconProxy.sol";

contract BizardryFacet is Modifiers{

    function createERC20(string memory _name, string memory _symbol, uint256 _initialValue) external onlyOwner {
        AppStorage storage s = LibAppStorage.diamondStorage();
        
        BeaconProxy proxy = new BeaconProxy(
            s.ERC20_Impl[0].proxy,
            abi.encodeWithSignature("initialize(string,string,uint256)", _name, _symbol,_initialValue)
        );


    }
}
