// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts/proxy/beacon/BeaconProxy.sol";

interface IBizardryFacet {
    function addUser(address _addr) external;
}

contract Bizardry is Initializable, AccessControlUpgradeable, UUPSUpgradeable {
    // struct Beacon {
    //     uint id;
    //     string name;
    //     address beaconAddress;
    //     uint version;
    //     uint networkId;
    // }

    /// @custom:oz-upgrades-unsafe-allow constructor
    function initialize() public initializer {
        __AccessControl_init();
        __UUPSUpgradeable_init();
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    function _authorizeUpgrade(
        address newImplementation
    ) internal override onlyRole(DEFAULT_ADMIN_ROLE) {}

    // address public beacon;

    address constant diamondAddress =
        0x1493Ae190717fF95503dA9F1E813D6ACafc18A98;

    function addUser() public {
        IBizardryFacet(diamondAddress).addUser(msg.sender);
    }
    // constructor(address beacon_) {
    //     beacon = beacon_;
    // }

    // function createToken(string memory name, string memory symbol,uint _initialAmount,address _owner) public view returns(address){
    //     BeaconProxy proxy = new BeaconProxy(
    //         beacon,
    //         abi.encodeWithSignature("initialize(string,string,uint,address)", name, symbol, _initialAmount, _owner)
    //     );

    //     return address(proxy);
    // }
}
