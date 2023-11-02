pragma solidity ^0.8.17;

abstract contract VersionAware {
    string public versionAwareContractName;
 
    function getContractNameWithVersion()
    external
    pure
    virtual returns (string memory);
}