pragma solidity ^0.8.0;

abstract contract Version {
    function getVersion() public pure virtual returns (string memory);

    function getVersionList() public pure virtual returns (string[] memory);

    function getLatestVersion() public pure virtual returns (string memory);

    function upgradeVersion() public virtual;

    function upgradeToSelectVersion() public virtual;
}
