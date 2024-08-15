import { ethers } from "hardhat";

async function main() {
    try {
        const tokenAddress = process.env.CONTRACT_ADDRESS;
        console.log("Token Address:", tokenAddress);
        const MyToken = await ethers.getContractAt("MyToken", tokenAddress);
    
        const [ signer ] = await ethers.getSigners();        
        
        const name = await MyToken.name();
        const symbol = await MyToken.symbol();
        const totalSupply = await MyToken.totalSupply();
    
        console.log(`Name: ${name}`);
        console.log(`Symbol: ${symbol}`);
        console.log(`Total Supply: ${totalSupply}`);
    
        const balance = await MyToken.balanceOf(signer.address);
        console.log(`Balance of ${signer.address}: ${ethers.formatEther(balance)} ${symbol}`);
        
    } catch (error) {
        console.error(error);
        process.exitCode = 1;
    }
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
