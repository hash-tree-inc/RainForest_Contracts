import { ethers } from "hardhat";
import { FacetCutAction, getSelectors } from "./libraries/diamond";

export async function deployDiamond() {
  const accounts = await ethers.getSigners();
  const contractOwner = accounts[0];

  // deploy DiamondCutFacet
  const DiamondCutFacet = await ethers.getContractFactory("DiamondCutFacet");
  const diamondCutFacet = await DiamondCutFacet.deploy();
  await diamondCutFacet.waitForDeployment();
  console.log("DiamondCutFacet deployed:", await diamondCutFacet.getAddress());

  // deploy Diamond
  const Diamond = await ethers.getContractFactory("RainForest");
  const diamond = await Diamond.deploy(
    contractOwner.address,
    await diamondCutFacet.getAddress()
  );
  await diamond.waitForDeployment();
  console.log("Diamond deployed:", await diamond.getAddress());

  // deploy DiamondInit
  // DiamondInit provides a function that is called when the diamond is upgraded to initialize state variables
  // Read about how the diamondCut function works here: https://eips.ethereum.org/EIPS/eip-2535#addingreplacingremoving-functions
  const DiamondInit = await ethers.getContractFactory("DiamondInit");
  const diamondInit = await DiamondInit.deploy();
  await diamondInit.waitForDeployment();
  console.log("DiamondInit deployed:", await diamondInit.getAddress());

  // deploy facets
  console.log("");
  console.log("Deploying facets");
  const FacetNames = ["DiamondLoupeFacet", "OwnershipFacet", "BizardryFacet"];
  const cut = [];
  for (const FacetName of FacetNames) {
    const Facet = await ethers.getContractFactory(FacetName);
    const facet = await Facet.deploy();
    await facet.waitForDeployment();
    // const facetContract = await ethers.getContractAt(FacetName, await facet.getAddress())
    console.log(`${FacetName} deployed: ${await facet.getAddress()}`);
    cut.push({
      facetAddress: await facet.getAddress(),
      action: FacetCutAction.Add,
      functionSelectors: getSelectors(Facet),
    });
  }

  // upgrade diamond with facets
  console.log("");
  console.log("Diamond Cut:", cut);
  const diamondCut = await ethers.getContractAt(
    "IDiamondCut",
    await diamond.getAddress()
  );
  let tx;
  let receipt;
  // call to init function
  let functionCall = diamondInit.interface.encodeFunctionData("init");
  tx = await diamondCut.diamondCut(
    cut,
    await diamondInit.getAddress(),
    functionCall
  );
  console.log("Diamond cut tx: ", tx.hash);
  receipt = await tx.wait();
  if (!receipt.status) {
    throw Error(`Diamond upgrade failed: ${tx.hash}`);
  }
  console.log("Completed diamond cut");
  return await diamond.getAddress();
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
deployDiamond().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
// 1;
// DiamondCutFacet deployed: 0x8dD39e2c79c5198a94F1053BDa7493d2B70EA5F2
// Diamond deployed: 0x1493Ae190717fF95503dA9F1E813D6ACafc18A98
// DiamondInit deployed: 0x6F35211dAFBDfBe339C1A4AaC23b3Aa7526b29Ca

// Deploying facets
// DiamondLoupeFacet deployed: 0x26Bc22CC528F33b74f339a2635c4868496B15C44
// OwnershipFacet deployed: 0x0D6779fA8659B61d96FdB1Ec3478C1041bBCaFA6
// BizardryFacet deployed: 0xdD8e2d7160Ba40bf259D5A5bABAF79149fF7D35B

// Diamond Cut: [
//   {
//     facetAddress: '0x26Bc22CC528F33b74f339a2635c4868496B15C44',
//     action: 0,
//     functionSelectors: [
//       '0xcdffacc6',
//       '0x52ef6b2c',
//       '0xadfca15e',
//       '0x7a0ed627',
//       '0x01ffc9a7',
//       contract: [ContractFactory],
//       remove: [Function: remove],
//       get: [Function: get]
//     ]
//   },
//   {
//     facetAddress: '0x0D6779fA8659B61d96FdB1Ec3478C1041bBCaFA6',
//     action: 0,
//     functionSelectors: [
//       '0x8da5cb5b',
//       '0xf2fde38b',
//       contract: [ContractFactory],
//       remove: [Function: remove],
//       get: [Function: get]
//     ]
//   },
//   {
//     facetAddress: '0xdD8e2d7160Ba40bf259D5A5bABAF79149fF7D35B',
//     action: 0,
//     functionSelectors: [
//       '0x421b2d8b',
//       contract: [ContractFactory],
//       remove: [Function: remove],
//       get: [Function: get]
//     ]
//   }
// ]
// Diamond cut tx:  0xd5ab999b1f40f9dfd2a05cc23ef1315a219ddc944f76edb36f7f8f017517b5de
// Completed diamond cut
