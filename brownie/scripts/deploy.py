from brownie import Good, Factory, accounts


def main():
    deployedGood = Good.deploy("PC", {'from': accounts[0]})
    Factory.deploy(accounts[0], deployedGood, {'from': accounts[0]})
