// SPDX-License-Identifier: None
pragma solidity ^0.8.18;

interface IVersion {
    function getBizardryVersion() external view returns (uint256);

    function setgetBizardryVersion(uint256 _version) external returns (bool);
}
