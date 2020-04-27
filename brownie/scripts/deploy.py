from brownie import Token, Good, Factory, accounts


def main():
    Token.deploy(1e18, {'from': accounts[0]})
    deployedGood = Good.deploy("PC", {'from': accounts[0]})
    print(deployedGood)
