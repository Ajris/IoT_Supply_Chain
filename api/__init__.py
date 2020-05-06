from flask import Flask
from web3 import Web3

app = Flask(__name__)
w3 = Web3(Web3.HTTPProvider("http://localhost:8545"))
w3.eth.defaultAccount = w3.eth.accounts[0]

from . import views
