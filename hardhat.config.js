require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  networks: {
    bnbtestnet: {
      url: "https://indulgent-newest-leaf.bsc-testnet.discover.quiknode.pro/8a8483b20d028a2b4ca603f1f86a6f1d702a6624/",
      accounts: [
        "338f0df5db87bda059dee8fe83081b59e66e0337684cd8fbf249da55d1ae6ebb",
      ],
    },
  },
 
};