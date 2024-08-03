const { ethers } = require("hardhat");

async function main() {
  // Ganti dengan alamat kontrak yang sudah dideploy
  const testPertamaCuyAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";
  const testPertamaCuy = await ethers.getContractAt(
    "testPertamaCuy",
    testPertamaCuyAddress
  );

  const pemilik = await testPertamaCuy.getPemilik();
  console.log("ini pemiliknya: ", pemilik);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
