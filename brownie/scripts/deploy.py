from brownie import HelloWorld, accounts


def main():
    accounts.load(accounts.load()[0])
    HelloWorld.deploy({'from': accounts[0]})

