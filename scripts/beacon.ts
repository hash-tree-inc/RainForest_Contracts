// import { ethers,upgrades } from "hardhat";


// async function main() {
//     const BeaconProxyPatternV1 = await ethers.getContractFactory("BeaconProxyPatternV1");
//     const beacon = await upgrades.deployBeacon(BeaconProxyPatternV1, {unsafeAllow: ['constructor']});
//     await beacon.waitForDeployment();
//     console.log(`Beacon with Beacon Proxy Pattern V1 as implementation is deployed to address: ${await beacon.getAddress()}`);

//     const beaconProxy1 = await upgrades.deployBeaconProxy(await beacon.getAddress(), BeaconProxyPatternV1, []);
//     await beaconProxy1.waitForDeployment();
//     let versionAwareContractName = await beaconProxy1.getContractNameWithVersion();
//     console.log(`Proxy Pattern and Version from Proxy 1 Implementation: ${versionAwareContractName}`);

//     const beaconProxy2 = await upgrades.deployBeaconProxy(await beacon.getAddress(), BeaconProxyPatternV1, []);

//     versionAwareContractName = await beaconProxy2.getContractNameWithVersion();
//     console.log(`Proxy Pattern and Version from Proxy 2 Implementation: ${versionAwareContractName}`);

//     const BeaconProxyPatternV2 = await ethers.getContractFactory("BeaconProxyPatternV2");
//     const upgradedBeacon = await upgrades.upgradeBeacon(await beacon.getAddress(), BeaconProxyPatternV2, {unsafeAllow: ['constructor']});
//     console.log(`Beacon upgraded with Beacon Proxy Pattern V2 as implementation at address: ${await upgradedBeacon.getAddress()}`);

//     versionAwareContractName = await beaconProxy1.getContractNameWithVersion();
//     console.log(`Proxy Pattern and Version from Proxy 1 Implementation: ${versionAwareContractName}`);

//     versionAwareContractName = await beaconProxy2.getContractNameWithVersion();
//     console.log(`Proxy Pattern and Version from Proxy 2 Implementation: ${versionAwareContractName}`);

//     versionAwareContractName = await beaconProxy1.versionAwareContractName();
//     console.log(`Proxy Pattern and Version from Proxy 1 Storage: ${versionAwareContractName}`);

//     versionAwareContractName = await beaconProxy2.versionAwareContractName();
//     console.log(`Proxy Pattern and Version from Proxy 2 Storage: ${versionAwareContractName}`);

//     const initTx = await beaconProxy1.initialize();
//     const receipt = await initTx.wait();

//     versionAwareContractName = await beaconProxy1.versionAwareContractName();
//     console.log(`Proxy Pattern and Version from Proxy 1 Storage: ${versionAwareContractName}`);

//     versionAwareContractName = await beaconProxy2.versionAwareContractName();
//     console.log(`Proxy Pattern and Version from Proxy 2 Storage: ${versionAwareContractName}`);

// }

// // We recommend this pattern to be able to use async/await everywhere
// // and properly handle errors.
// main().catch((error) => {
//   console.error(error);
//   process.exitCode = 1;
// });
// 1