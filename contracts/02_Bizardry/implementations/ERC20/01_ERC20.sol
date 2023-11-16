// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract Bizardry_ERC20 is Initializable, ERC20Upgradeable, OwnableUpgradeable {
    uint public bz20_version = 1;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(
        address initialOwner,
        string memory _name,
        string memory _symbol,
        uint256 _initialValue
    ) public initializer {
        __ERC20_init(_name, _symbol);
        __Ownable_init(initialOwner);
        _mint(msg.sender, _initialValue);
    }

    function mint(address account, uint256 amount) external {
        _mint(account, amount);
    }

    function burn(address account, uint256 amount) external {
        _burn(account, amount);
    }
}
