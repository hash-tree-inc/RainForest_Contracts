// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@layerzerolabs/solidity-examples/contracts/token/oft/v2/OFTV2.sol";

contract OFTV2_IMPL is OFTV2 {
    constructor(
        address _layerZeroEndpoint,
        uint _initialSupply,
        uint8 _sharedDecimals,
        string memory _name,
        string memory _symbol
    ) OFTV2(_name, _symbol, _sharedDecimals, _layerZeroEndpoint) {
        _mint(_msgSender(), _initialSupply);
    }
}

contract OFTV2_Factory {
    address[] public deployedContracts;

    function deployOftv2(
        address _layerZeroEndpoint,
        uint _initialSupply,
        uint8 _sharedDecimals,
        string memory _name,
        string memory _symbol
    ) public {
        OFTV2_IMPL newContract = new OFTV2_IMPL(
            _layerZeroEndpoint,
            _initialSupply,
            _sharedDecimals,
            _name,
            _symbol
        );
        deployedContracts.push(address(newContract));
    }
}
