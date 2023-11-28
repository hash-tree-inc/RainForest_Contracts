/* global describe it before ethers */

import {
  getSelectors,
  FacetCutAction,
  removeSelectors,
  findAddressPositionInFacets,
} from "../scripts/libraries/diamond";
import { deployDiamond } from "../scripts/deploy";
import { assert } from "chai";
import { ethers } from "hardhat";
import { Contract } from "ethers";


describe("DiamondTest", async function () {
  let diamondAddress: string;
  let diamondCutFacet: Contract;
  let diamondLoupeFacet: Contract;
  let ownershipFacet: Contract;
  let RainForestFacet: Contract;
  let tx;
  let receipt;
  let result;
  const addresses: string[] = [];
  // const accounts =  ethers.getSigners();    
  
  before(async function () {
    diamondAddress = await deployDiamond();
    console.log({ diamondAddress });
    diamondCutFacet = await ethers.getContractAt(
      "DiamondCutFacet",
      diamondAddress
    );
    diamondLoupeFacet = await ethers.getContractAt(
      "DiamondLoupeFacet",
      diamondAddress
    );
    ownershipFacet = await ethers.getContractAt(
      "OwnershipFacet",
      diamondAddress
    );

    RainForestFacet = await ethers.getContractAt(
      "RainForestFacet",
      diamondAddress
    );
  });

  
  it("facet address 몇개? ", async () => {
    for (const address of await diamondLoupeFacet.facetAddresses()) {
      addresses.push(address);
    }
    console.log({ addresses });
    assert.equal(addresses.length, 5);
    
  });  
  
  
  
  it('initializes the contract with the correct values', async () => {
    await RainForestFacet.init('RainForest', 'RAF', 1000, 10000);

    const name = await RainForestFacet.name();
    const symbol = await RainForestFacet.symbol();
    const totalSupply = await RainForestFacet.totalSupply();
    // const maxSupply = await RainForestFacet.maxSupply();

    console.log({ name, symbol, totalSupply });
  })
  
  it('mint limit test' , async()=>{
    const mint = await RainForestFacet.tokenBuy(ethers.parseEther('10'), {value: ethers.parseEther('10')});
    console.log({ mint });
    // rainforest ether get balance
    const balance = await ethers.provider.getBalance(RainForestFacet.getAddress());
    console.log({ balance });
    
  
    
  })
});
