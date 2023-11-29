import { task, types } from "hardhat/config";
import "@nomicfoundation/hardhat-ethers";
import { taskTest } from "./test";

task("hello", "prints hello params")
  .addParam("params", "params for hello task")
  .setAction(async (params, ethers) => {
    taskTest(params, ethers);
  });

// task(
//   "blockNumber",
//   "prints the current block number",
//   async (_, { ethers }) => {
//     await ethers.provider.getBlockNumber().then((blockNumber) => {
//       console.log(blockNumber);
//     });
//   }
// );
