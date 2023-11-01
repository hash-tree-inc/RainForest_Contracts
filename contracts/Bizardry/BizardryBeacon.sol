// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts/proxy/beacon/BeaconProxy.sol";
contract Bizardry is Initializable, AccessControlUpgradeable ,UUPSUpgradeable {

    /// @custom:oz-upgrades-unsafe-allow constructor
    function initialize() initializer public {
        __AccessControl_init();
        __UUPSUpgradeable_init();
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }
    // address public beacon;

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
