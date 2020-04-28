import json

from . import app, w3

ADDRESS = '0xDc67312a5302D0e113A8c27220D4F3281AfeB9d2'


@app.route('/')
def index():
    with open('brownie/build/contracts/SPToken.json') as f:
        source = json.loads(f.read())
    abi = source['abi']
    contract = w3.eth.contract(address=ADDRESS, abi=abi)

    tx_hash = contract.functions.balanceOf('0xA06BC4aa79553F765b6a3548ee4f2d4a3C76715F').transact()
    receipt = w3.eth.waitForTransactionReceipt(tx_hash)
#    return {'status': receipt['status']}

    return dict(receipt)
