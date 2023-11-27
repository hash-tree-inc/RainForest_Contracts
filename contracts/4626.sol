
// // pragma solidity ^0.8.20;

// // import {IERC20, ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// // import {ERC20Upgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
// // import {ERC4626Upgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC4626Upgradeable.sol";
// // import {Initilizable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
// // import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20PermitUpgradeable.sol";
// // import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20VotesUpgradeable.sol";
// // import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
// // import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

// // contract SEED is Initializable, ERC4626Upgradeable, ERC20PermitUpgradeable, ERC20VotesUpgradeable, AccessControlUpgradeable, UUPSUpgradeable {
// //     bytes32 public constant UPGRADER_ROLE = keccak256("UPGRADER_ROLE");

// //     /// @custom:oz-upgrades-unsafe-allow constructor
// //     constructor() {
// //         _disableInitializers();
// //     }

// //     function initialize(address defaultAdmin, address upgrader)
// //         initializer public
// //     {
// //         __ERC20_init("SEED", "SEED");
// //         __ERC20Permit_init("SEED");
// //         __ERC20Votes_init();
// //         __AccessControl_init();
// //         __UUPSUpgradeable_init();

// //         _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
// //         _grantRole(UPGRADER_ROLE, upgrader);
// //     }


// // }



// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.20;

// import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
// import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20PausableUpgradeable.sol";
// import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
// import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20PermitUpgradeable.sol";
// import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20VotesUpgradeable.sol";
// import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

// contract MyToken is Initializable, ERC20Upgradeable, ERC20PausableUpgradeable, OwnableUpgradeable, ERC20PermitUpgradeable, ERC20VotesUpgradeable {
//     /// @custom:oz-upgrades-unsafe-allow constructor
//     constructor() {
//         _disableInitializers();
//     }

//     function initialize(address initialOwner) initializer public {
//         __ERC20_init("MyToken", "MTK");
//         __ERC20Pausable_init();
//         __Ownable_init(initialOwner);
//         __ERC20Permit_init("MyToken");
//         __ERC20Votes_init();
//     }

//     function pause() public onlyOwner {
//         _pause();
//     }

//     function unpause() public onlyOwner {
//         _unpause();
//     }

//     // The following functions are overrides required by Solidity.

//     function _update(address from, address to, uint256 value)
//         internal
//         override(ERC20Upgradeable, ERC20PausableUpgradeable, ERC20VotesUpgradeable)
//     {
//         super._update(from, to, value);
//     }

//     function nonces(address owner)
//         public
//         view
//         override(ERC20PermitUpgradeable, NoncesUpgradeable)
//         returns (uint256)
//     {
//         return super.nonces(owner);
//     }
// }