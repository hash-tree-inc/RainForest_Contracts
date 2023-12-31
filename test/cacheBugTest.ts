import { ethers } from "hardhat";
import { deployDiamond } from "../scripts/deploy";
import { FacetCutAction } from "../scripts/libraries/diamond";
import { assert } from "chai";
import { BaseContract, Contract, ContractTransactionResponse } from "ethers";

// The diamond example comes with 8 function selectors
// [cut, loupe, loupe, loupe, loupe, erc165, transferOwnership, owner]
// This bug manifests if you delete something from the final
// selector slot array, so we'll fill up a new slot with
// things, and have a fresh row to work with.
describe("Cache bug test", async () => {
  let diamondLoupeFacet: Contract;
  let test1Facet: Contract;
  const ownerSel = "0x8da5cb5b";

  const sel0 = "0x19e3b533"; // fills up slot 1
  const sel1 = "0x0716c2ae"; // fills up slot 1
  const sel2 = "0x11046047"; // fills up slot 1
  const sel3 = "0xcf3bbe18"; // fills up slot 1
  const sel4 = "0x24c1d5a7"; // fills up slot 1
  const sel5 = "0xcbb835f6"; // fills up slot 1
  const sel6 = "0xcbb835f7"; // fills up slot 1
  const sel7 = "0xcbb835f8"; // fills up slot 2
  const sel8 = "0xcbb835f9"; // fills up slot 2
  const sel9 = "0xcbb835fa"; // fills up slot 2
  const sel10 = "0xcbb835fb"; // fills up slot 2

  before(async function () {
    let tx;
    let receipt;

    let selectors = [
      sel0,
      sel1,
      sel2,
      sel3,
      sel4,
      sel5,
      sel6,
      sel7,
      sel8,
      sel9,
      sel10,
    ];

    let diamondAddress = await deployDiamond();
    let diamondCutFacet = await ethers.getContractAt(
      "DiamondCutFacet",
      diamondAddress
    );
    diamondLoupeFacet = await ethers.getContractAt(
      "DiamondLoupeFacet",
      diamondAddress
    );
  });
});
