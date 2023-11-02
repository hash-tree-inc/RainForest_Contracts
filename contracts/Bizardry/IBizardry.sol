// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface IBizardryFacet {
    event CreatedBeacon();
    event CreatedVersion();
    event CreatedContract();

    function reigsterBeacon(address _beacon) external;

    function reigsterVersion(address _version) external;

    function reigsterContract(address _contract) external;

    function registerUser(
        address _userAddr,
        string memory _nation,
        string memory _useWalletType,
        bool _isBlack
    ) external;
}
