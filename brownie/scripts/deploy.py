from brownie import SPToken, Good, Factory, accounts


def main():
    SPToken.deploy(1e18, {'from': accounts[0]})
    deployedGood = Good.deploy("PC", {'from': accounts[0]})
    Factory.deploy(deployedGood, {'from': accounts[0]})
