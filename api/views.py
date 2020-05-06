import json
from flask import render_template

from . import app, w3
from .utils import serialize_receipt

CONTRACT_ADDRESS = '0xDc67312a5302D0e113A8c27220D4F3281AfeB9d2'
WALLET_ADDRESS = '0xA06BC4aa79553F765b6a3548ee4f2d4a3C76715F'


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/balance/<wallet>')
def balance_of(wallet: str):
    with open('brownie/build/contracts/SPToken.json') as f:
        source = json.loads(f.read())
    abi = source['abi']
    contract = w3.eth.contract(address=CONTRACT_ADDRESS, abi=abi)

    tx_hash = contract.functions.balanceOf(WALLET_ADDRESS).transact()
    receipt = w3.eth.waitForTransactionReceipt(tx_hash)
    return serialize_receipt(receipt)
