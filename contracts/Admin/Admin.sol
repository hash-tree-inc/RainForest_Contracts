// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

// 여러 컨트랙트들의 정보(constant)를 관리하고
// MAIN, DEV를 구분하여 관리한다.
// 각 컨트랙트들을 dev, main을 구분으로
// 필요한 inject 정보를 제공한다.
contract Admin is Initializable, AccessControlUpgradeable, UUPSUpgradeable {
    bytes32 public constant MAIN_ADMIN_ROLE = keccak256("MAIN_ADMIN_ROLE");
    bytes32 public constant DEV_ADMIN_ROLE = keccak256("DEV_ADMIN_ROLE");

    struct ContractInfo {
        string contractName;
        address contractAddress;
        uint contractVersion;
        uint networkId;
    }

    mapping(string => ContractInfo) public main_contracts;
    mapping(string => ContractInfo) public dev_contracts;

    function initialize() public initializer {
        __AccessControl_init();
        __UUPSUpgradeable_init();

        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MAIN_ADMIN_ROLE, msg.sender);
    }

    function _authorizeUpgrade(
        address newImplementation
    ) internal override onlyRole(DEFAULT_AMDIN_ROLE) {}

    function addMainContract(
        string memory _contractName,
        address _contractAddress,
        uint _contractVersion,
        uint _networkId
    ) external onlyRole(MAIN_ADMIN_ROLE) {
        main_contracts[_contractName] = ContractInfo(
            _contractName,
            _contractAddress,
            _contractVersion,
            _networkId
        );
    }

    function addDevContract(
        string memory _contractName,
        address _contractAddress,
        uint _contractVersion,
        uint _networkId
    ) external onlyRole(DEV_ADMIN_ROLE) {
        dev_contracts[_contractName] = ContractInfo(
            _contractName,
            _contractAddress,
            _contractVersion,
            _networkId
        );
    }
}
