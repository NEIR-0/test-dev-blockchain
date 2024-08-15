const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("FirstMintingToken", (m) => {
  // Define the initial supply (e.g., 1 million tokens with 18 decimals)
  const initialSupply = m.getParameter("initialSupply", "1000000000000000000000000");

  // Deploy the MyToken contract with the initial supply
  const myToken = m.contract("MyToken", [initialSupply]);

  return { myToken };
});