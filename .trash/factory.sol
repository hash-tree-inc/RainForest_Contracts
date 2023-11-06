// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.0;

// import "@openzeppelin/contracts/proxy/beacon/BeaconProxy.sol";

// contract TokenFactory {
//     address public beacon;

//     constructor(address beacon_) {
//         beacon = beacon_;
//     }

//     function createToken(string memory name, string memory symbol) public {
//         BeaconProxy proxy = new BeaconProxy(
//             beacon,
//             abi.encodeWithSignature("initialize(string,string)", name, symbol)
//         );

//         // 이제 `proxy` 주소는 새로운 ERC-20 토큰을 대표합니다.
//     }
// }
