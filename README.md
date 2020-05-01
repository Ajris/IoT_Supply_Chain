# IoT_Supply_Chain

## Setup

```
virtualenv venv

source venv/bin/activate

pip install -r requirements

brownie networks add Private IoT host=http://127.0.0.1:8545/ chainid=15

brownie run deploy.py --network IoT

```

