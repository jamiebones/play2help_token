// scripts/deploy_upgradeable_box.js
const { ethers, upgrades } = require("hardhat");

async function main() {
  const Play2Help = await ethers.getContractFactory("Play2Help");
  console.log("Deploying Play2Help Token...");
  const play2Help = await upgrades.deployProxy(
    Play2Help,
    ["Play2Help", "P2H"],
    {
      initializer: "initialize",
    }
  );
  await play2Help.deployed();
  console.log("Token deployed to:", play2Help.address);
}

main();

//contract deploy address

//0xc2da06C729f59B2Fa39be0e700247333ad713d50

//contract address on mainnet: https://bscscan.com/address/0xc2da06C729f59B2Fa39be0e700247333ad713d50#code

//contract implementation address on mainnet: https://bscscan.com/address/0xDC6e9fc05a5d31016Da7d9E6fc3497AF03B6532b#code
