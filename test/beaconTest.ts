import { expect } from "chai";
import { ethers,upgrades } from "hardhat";


describe("Box", function() {
    it('works', async () => {
      const Beacon = await ethers.getContractFactory("BeaconProxyPatternV1");
      const Beacon2 = await ethers.getContractFactory("BeaconProxyPatternV2");
  
      const beacon = await upgrades.deployBeacon(Beacon, {unsafeAllow: ['constructor']});
        console.log('Beacon =>',await beacon.getAddress())

      const instance = await upgrades.deployBeaconProxy(beacon, Beacon);
        console.log('instance =>',await instance.getAddress())

      const versionAwareContractName = await instance.getContractNameWithVersion();
      console.log(`Proxy Pattern and Version from Proxy 1 Implementation: ${versionAwareContractName}`);
      await upgrades.upgradeBeacon(beacon, Beacon2,  {unsafeAllow: ['constructor']});
      console.log('Beacon2 =>',await beacon.getAddress())
      const upgraded = Beacon2.attach(await instance.getAddress());
      
      console.log(`Proxy Pattern and Version from Proxy 2 Implementation: ${versionAwareContractName}`);
      const versionAwareContractName2 = await upgraded.getContractNameWithVersion();
        console.log(`Proxy Pattern and Version from Proxy 2 Implementation: ${versionAwareContractName2}`);
    //   const value = await upgraded.value();
    //   expect(value.toString()).to.equal('42');
    });
  });