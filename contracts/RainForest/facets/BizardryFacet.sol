// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {AppStorage, Modifiers, LibAppStorage} from "../libraries/LibAppStorage.sol";
// import "../interfaces/IBizardry.sol";

contract BizardryFacet is Modifiers {
    /**
    @dev Bizardry implementation contract 관리
     */

    function bz_add_Implementation(
        string memory _impleName,
        address _implementation,
        uint _version,
        uint _type
    ) external onlyOwner {
        AppStorage storage s = LibAppStorage.diamondStorage();
    }

    /**
    @dev user functions
     */
    function bz_payment() external {}

    function bz_erc20_deploy() external {}

    function bz_erc721_deploy() external {}

    function bz_erc1155_deploy() external {}

    // implement Version Upgrade
    function bz_upgrade() external {}

    // use layerZero
    function bz_add_multichain_adapter() external {}
}
