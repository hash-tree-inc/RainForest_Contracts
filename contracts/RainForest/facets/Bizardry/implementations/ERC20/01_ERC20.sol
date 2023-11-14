// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "../interfaces/IVersion.sol";
contract ERC20 is Initializable, ERC20Upgradeable {
    uint constant bizardryVersion = 1;

    function initialize(
        string memory _name,
        string memory _symbol,
        uint256 _initialValue
    ) public initializer {
        __ERC20_init(_name, _symbol);
        _mint(msg.sender, _initialValue);
    }

    function mint(address account, uint256 amount) external {
        _mint(account, amount);
    }

    function burn(address account, uint256 amount) external {
        _burn(account, amount);
    }

    function getBizardryVersion() external pure returns (uint) {
        return bizardryVersion;
    }
}