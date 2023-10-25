task("erc20-transfer", "Calls balanceOf function")
  .addParam("diamond", "The Diamond contract address you want to call")
  .addParam("to", "The account to transfer to")
  .addParam("amount", "The amount to transfer")
  .setAction(async (taskArgs, hre) => {
    const accounts = await ethers.getSigners()
    const signer = accounts[0]

    const Facet = await ethers.getContractFactory("MockERC20Facet")
    const facet = new ethers.Contract(taskArgs.diamond,Facet.interface, signer)
    console.log('MockERC20 interface fetched:', facet.address)

    const tx = await facet.transfer(taskArgs.to, tarskArgs.amount)
    console.log("RESPONSE: ",tx)
  }
)

module.exports = {}
