// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.17;

// import "@layerzerolabs/solidity-examples/contracts/lzApp/NonblockingLzApp.sol";

// contract TestApp is NonblockingLzApp {
//     // A public string variable named "data" is declared. This will be the message sent to the destination.

//     string public data;

//     // A uint16 variable named "destChainId" is declared to hold the LayerZero Chain Id of the destination blockchain.

//     uint16 destChainId;

//     //This constructor initializes the contract with our source chain's _lzEndpoint.

//     constructor(address _lzEndpoint) NonblockingLzApp(_lzEndpoint) Ownable() {
//         // if(_lzEndpoint == 0x6aB5Ae6822647046626e83ee6dB8187151E1d5ab) destChainId = 10109;
//         // if(_lzEndpoint == 0xf69186dfBa60DdB133E91E9A4B5673624293d8F8) destChainId = 10150;
//     }

//     // This function is called when data is received. It overrides the equivalent function in the parent contract.

//     function _nonblockingLzReceive(
//         uint16,
//         bytes memory,
//         uint64,
//         bytes memory _payload
//     ) internal override {
//         // The LayerZero _payload (message) is decoded as a string and stored in the "data" variable.

//         data = abi.decode(_payload, (string));
//     }

//     // This function is called to send the data string to the destination.

//     // It's payable, so that we can use our native gas token to pay for gas fees.

//     function send(string memory _message) public payable {
//         // The message is encoded as bytes and stored in the "payload" variable.

//         bytes memory payload = abi.encode(_message);

//         // The data is sent using the parent contract's _lzSend function.

//         _lzSend(
//             destChainId,
//             payload,
//             payable(msg.sender),
//             address(0x0),
//             bytes(""),
//             msg.value
//         );
//     }

//     // This function allows the contract owner to designate another contract address to trust.

//     // It can only be called by the owner due to the "onlyOwner" modifier.

//     // NOTE: In standard LayerZero contract's, this is done through SetTrustedRemote.

//     function trustAddress(address _otherContract) public onlyOwner {
//         trustedRemoteLookup[destChainId] = abi.encodePacked(
//             _otherContract,
//             address(this)
//         );

//         // This function estimates the fees for a LayerZero operation.

//         // It calculates the fees required on the source chain, destination chain, and by the LayerZero protocol itself.

//         // @param dstChainId The LayerZero endpoint ID of the destination chain where the transaction is headed.

//         // @param adapterParams The LayerZero relayer parameters used in the transaction.

//         // Default Relayer Adapter Parameters = 0x00010000000000000000000000000000000000000000000000000000000000030d40

//         // @param _message The message you plan to send across chains.

//         // @return nativeFee The estimated fee required denominated in the native chain's gas token.
//     }

//     function estimateFees(
//         uint16 dstChainId,
//         bytes calldata adapterParams,
//         string memory _message
//     ) public view returns (uint nativeFee, uint zroFee) {
//         //Input the message you plan to send.

//         bytes memory payload = abi.encode(_message);

//         // Call the estimateFees function on the lzEndpoint contract.

//         // This function estimates the fees required on the source chain, the destination chain, and by the LayerZero protocol.

//         return
//             lzEndpoint.estimateFees(
//                 dstChainId,
//                 address(this),
//                 payload,
//                 false,
//                 adapterParams
//             );
//     }
// }
