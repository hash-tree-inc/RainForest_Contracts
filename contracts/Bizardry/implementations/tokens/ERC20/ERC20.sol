// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20PermitUpgradeable.sol";

contract BizardryERC20 is
    Initializable,
    ERC20Upgradeable,
    ERC20BurnableUpgradeable,
    OwnableUpgradeable,
    ERC20PermitUpgradeable
{

    function initialize(
        string memory _name,
        string memory _symbol,
        address _owner
    ) public initializer {
        __ERC20_init(_name, _symbol);
        __ERC20Burnable_init();
        __Ownable_init(_owner);
        __ERC20Permit_init(_name);
        
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    
}
