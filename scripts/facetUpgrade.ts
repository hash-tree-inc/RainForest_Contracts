import { ethers } from "hardhat";
import { FacetCutAction, getSelectors } from "./libraries/diamond";

async function addFunction() {
  // const newFacet = await ethers.getContractFactory('VIVARIUM')
  // const newfacet = await newFacet.deploy()

  const newFacet = await ethers.getContractFactory("BizardryFacet");
    const newfacet = await newFacet.deploy();
    await newfacet.waitForDeployment();

  //   const
  // const newFuncs = [
  //     getSelectors(newFacet),
  // ]

  // const exstingFuncs = getSelectors(newfacet)

  const cut = [
    {
      //   facetAddress: _.vivariumFacetAddress,
      facetAddress: await newfacet.getAddress(),
      action: FacetCutAction.Add,
      functionSelectors: getSelectors(newFacet),
    },
  ];

  console.log(cut);

  const diamondCut = await ethers.getContractAt(
    "IDiamondCut",
    // _.diamondAddress
    "0x1493Ae190717fF95503dA9F1E813D6ACafc18A98"
  );
  const diamondInit = await ethers.getContractAt(
    "DiamondInit",
    // _.diamondInitAddress
    "0x6F35211dAFBDfBe339C1A4AaC23b3Aa7526b29Ca"
  );
  let functionCall = diamondInit.interface.encodeFunctionData("init");
  const tx = await await diamondCut.diamondCut(
    cut,
    // _.diamondInitAddress,
    "0x6F35211dAFBDfBe339C1A4AaC23b3Aa7526b29Ca",
    functionCall,
    { gasLimit: 3000000 }
  );
  // const tx = await diamondCut.diamondCut(cut, ethers.ZeroAddress, '0x', { gasLimit: 3000000 })
  const receipt = await tx.wait();
  if (!receipt.status) {
    throw Error(`Diamond upgrade failed: ${tx.hash}`);
  }
  console.log("Completed diamond cut: ", tx.hash);
}

addFunction().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
