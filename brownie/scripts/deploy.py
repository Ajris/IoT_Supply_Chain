from brownie import *

def main():
    HelloWorld.deploy("My Real Token", "RLT", 18, 1e28, {'from': 'me'})
