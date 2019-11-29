var TraficLights = artifacts.require("./TraficLights");

module.exports = function(deployer) {
    deployer.deploy(TraficLights);
};