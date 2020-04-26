from brownie import HelloWorld, accounts


def main():
    account = accounts.load('deployer')
    HelloWorld.deploy({'from': account})

