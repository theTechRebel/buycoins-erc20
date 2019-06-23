const FirstnameLastname = artifacts.require("FirstNameLastnameToken");

module.exports = function(deployer) {
  deployer.deploy(FirstnameLastname,"TinasheDumburaToken","TD",1000,8);
};
