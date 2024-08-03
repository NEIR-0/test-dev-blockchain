const {
  time,
  loadFixture,
} = require("@nomicfoundation/hardhat-toolbox/network-helpers");
// const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");

describe("testPertamaCuy", function () {
  async function deployTestPertamaCuy() {
    const [owner, addr1] = await ethers.getSigners();

    const TestPertamaCuy = await ethers.getContractFactory("testPertamaCuy");
    console.log("TestPertamaCuy: ", TestPertamaCuy);

    const deploy = await TestPertamaCuy.deploy();
    console.log("deploy: ", deploy);

    return { deploy, owner, addr1 };
  }

  it("Harus mengatur owner dengan benar saat deployment", async function () {
    const { deploy, owner } = await loadFixture(deployTestPertamaCuy);
    // console.log(deploy, ">>>>");
    // console.log("==========================================================");
    // console.log(owner, "<<<<<<<");

    expect(await deploy.owner()).to.equal(owner.address);
  });
});
