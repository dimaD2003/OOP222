
const {ethers}= require('hardhat')
const hre = require("hardhat");
const { networks } = require('../hardhat.config');


async function main() {
  //deploy air
  const [owner] = await ethers.getSigners();
  const Airdrop = await hre.ethers.getContractFactory("Airdrop");
  const airdrop = await Airdrop.deploy();
  await airdrop.deployed();

  console.log(`contract airdrop address  ${airdrop.address}`);

console.log(`Deploying Airdrop contract with the account: ${owner.address}`);

//deploy token
const myToken = await hre.ethers.getContractFactory("Token");
  const token = await myToken.deploy("FAkeToken","FKT");
  await token.deployed();
  console.log(`contract token address  ${token.address}`);

  
//function transfer
const transf=await token.transfer(`${airdrop.address}`,2)
console.log(transf);

const bal=await token.balance(airdrop.address)
console.log('balane airdrop contract = ', bal);

const bal1=await token.balance(owner.address)
console.log('balane owner = ', bal1);

//transferAirdrop
const accounts=["0x205c657a1dd882f4d9D12E5CD388102D4cF46733","0xcbF2539da7C83f4Dec97C53a954Faa0FE6165A3A"]
const amount=[1,1]
await airdrop.airdropWithTransfer(token.address,  accounts,amount);
console.log(`we transfer to ${accounts[0]} and ${accounts[1]} `);


}

main()
.then(() => process.exit(0))
.catch(error => {
console.error(error);
process.exit(1);
});



