const taskTest = async (taskArgs: any, hre?: any) => {
  console.log(taskArgs);
  console.log(hre.network);

  let signers = await hre.ethers.getSigners();
  let owner = signers[0];

  console.log(owner);
};

export { taskTest };
