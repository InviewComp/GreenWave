require("dotenv").config();
const port = process.env.HOST_PORT || 9090;

module.exports = {
  networks: {
    mainnet: {
      // Don't put your private key here:
      privateKey: process.env.PRIVATE_KEY_MAINNET,
      userFeePercentage: 100,
      feeLimit: 1e9,
      fullHost: "https://api.trongrid.io",
      network_id: "1"
    },
    shasta: {
      privateKey: process.env.PRIVATE_KEY_SHASTA,
      userFeePercentage: 50,
      feeLimit: 1e9,
      fullHost: "https://api.shasta.trongrid.io",
      network_id: "2"
    },
    development: {
      privateKey:
        "5530cb047751079964d0c1ba80288629976d70c1534f571789d3edf835e5a2ca",
      userFeePercentage: 50,
      fullHost: "http://127.0.0.1:" + port,
      network_id: "9"
    }
  },
  compilers: {
    solc: {
      version: "0.4.24"
    }
  }
};
