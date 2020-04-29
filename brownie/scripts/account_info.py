from brownie import HelloWorld, accounts


def main():
    account = accounts.load('deployer')
    t = HelloWorld.deploy({'from':account})
    print(t)
