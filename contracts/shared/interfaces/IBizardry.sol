// SPDX-License-Identifier: None
pragma solidity ^0.8.18;

interface IBizardry {
    function getMyContracts(
        address _owner
    ) external view returns (address[] memory);

    function getDetails(address _contract) external view returns (address);

    function createERC20Token(
        string memory _name,
        string memory _symbol,
        uint256 _totalSupply
    ) external returns (address);

    function createERC721Token(
        string memory _name,
        string memory _symbol
    ) external returns (address);

    function createERC1155Token(
        string memory _name,
        string memory _symbol
    ) external returns (address);

    function versionUpdateERC20(
        address _contract,
        uint _version
    ) external returns (bool);

    function versionUpdateERC721(
        address _contract,
        uint _version
    ) external returns (bool);

    function versionUpdateERC1155(
        address _contract,
        uint _version
    ) external returns (bool);
}
