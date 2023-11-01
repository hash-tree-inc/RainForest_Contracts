// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/proxy/beacon/UpgradeableBeacon.sol";

contract BizardryProxy is UpgradeableBeacon {
    constructor(
        address _implementation,
        address _owner
    ) UpgradeableBeacon(_implementation, _owner) {}
}
