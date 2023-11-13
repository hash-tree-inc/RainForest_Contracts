// SPDX-License-Identifier: None
pragma solidity ^0.8.18;

interface IVersion {
    function getVersion() external view returns (uint256);

    function setVersion(uint256 _version) external returns (bool);
}
