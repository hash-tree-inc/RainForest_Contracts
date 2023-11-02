import { ethers, upgrades } from "hardhat";

async function main() {
  ////////////////////////// deployed  0x15e292dc6120ca940ddb2c96ed18e7f57fd3e87d ///오늘했음
  const Bizardry = await ethers.getContractFactory("Bizardry");
  const bizardry = await upgrades.deployProxy(Bizardry, []);

  await bizardry.waitForDeployment();
  console.log("Bizardry Address : ", await bizardry.getAddress());

  // const DB = await ethers.getContractAt('DB', '0xf8d293cC56c76001ACD6BCd653c9bDeE7FDdE287');

  // const setFunctions = async (_id: any, _class: any) => {
  // 	await DB.setPF(_id, _class);
  // };

  // const dataFor = async () => {
  // 	// for문
  // 	let count = 0;
  // 	let classes = {
  // 		normal: 0,
  // 		uncommon: 0,
  // 		rare: 0,
  // 		unique: 0,
  // 		legendary: 0,
  // 		myth: 0,
  // 		ancient: 0,
  // 	};
  // 	// test[i].id, test[i].class 뽑기
  // 	for (let i = 0; i < test.length; i++) {
  // 		// console.log(test[i].id, test[i].class);
  // 		++count;
  // 		//case문 class별로 뽑기
  // 		switch (test[i].class) {
  // 			case '1':
  // 				classes.normal++;
  // 				setFunctions(test[i].id, test[i].class);
  // 				break;
  // 			case '2':
  // 				classes.uncommon++;
  // 				setFunctions(test[i].id, test[i].class);
  // 				break;
  // 			case '3':
  // 				classes.rare++;
  // 				setFunctions(test[i].id, test[i].class);
  // 				break;
  // 			case '4':
  // 				classes.unique++;
  // 				setFunctions(test[i].id, test[i].class);
  // 				break;
  // 			case '5':
  // 				classes.legendary++;
  // 				setFunctions(test[i].id, test[i].class);
  // 				break;
  // 			case '6':
  // 				classes.myth++;
  // 				setFunctions(test[i].id, test[i].class);
  // 				break;
  // 			case '7':
  // 				classes.ancient++;
  // 				setFunctions(test[i].id, test[i].class);
  // 				break;
  // 			default:
  // 				break;
  // 		}
  // 	}
  // };
  // await dataFor();
}

// async function main() {
// 	const Contract = await ethers.getContractFactory('DBV2');

// 	// test 0x1F390DadA7e982873D7F70E77f231Ba0566FEf21
// 	// const contract2 = await upgrades.upgradeProxy('0x1F390DadA7e982873D7F70E77f231Ba0566FEf21', Contract, {});

// 	// main 0x0967358cB6a94aCF45A99Fb4ED199C081bbe2121
// 	const contract2 = await upgrades.upgradeProxy('0x0967358cB6a94aCF45A99Fb4ED199C081bbe2121', Contract, {});

// 	console.log('uptest deployed to : ', contract2.address);
// }

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

// deployed
// 0xf8d293cC56c76001ACD6BCd653c9bDeE7FDdE287
