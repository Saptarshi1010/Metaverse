// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {

  const Name = "Metaverse Builing";

  const Symbol = "MB";

  const Cost = hre.ethers.parseEther("1");

  const Land = await hre.ethers.deployContract("Land", [Name, Symbol], { value: Cost });

  const land = await Land.waitForDeployment();

  console.log(`contract of ${Name, Symbol} 
   with ${ethers.formatEther(Cost)}ETH has been deployed to ${land.adress}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

//0x5FbDB2315678afecb367f032d93F642f64180aa3
