#!/bin/bash

geth --datadir /privatenet/data/ init genesis.json 
geth --datadir /privatenet/data/ --password password.best account new
geth --networkid 15 --datadir /privatenet/data --rpc --rpcaddr 0.0.0.0 -rpcapi="db,eth,net,web3,personal,web3" --mine --miner.threads=1 --miner.gasprice 0
   

