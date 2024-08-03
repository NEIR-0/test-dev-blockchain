const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("TestGwIni", (m) => {
  const iniCodeGw = m.contract("testPertamaCuy");

  return { iniCodeGw };
});
