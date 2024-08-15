const { ethers } = require("hardhat");

async function main() {
  // Ganti dengan alamat kontrak yang sudah dideploy
  const testPertamaCuyAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";
  const testPertamaCuy = await ethers.getContractAt(
    "testPertamaCuy",
    testPertamaCuyAddress
  );

  const textAwal = await testPertamaCuy.textIki(); // string (textIki)
  console.log("ini textAwal: ", textAwal);

  const newText = "bambang"; // ubah ini nya
  const textUpdate = await testPertamaCuy.setTextIki(newText); // set-string (setTextIkis)
  // console.log(textUpdate, "???????");

  const newUpdateText = await testPertamaCuy.textIki(); // string (textIki)
  console.log("ini textUpdate: ", newUpdateText);
}


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
