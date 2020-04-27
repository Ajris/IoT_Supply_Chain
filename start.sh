#!/bin/bash

geth --networkid 15 --datadir /privatenet/data --rpc --rpcaddr 0.0.0.0 -rpcapi="db,eth,net,web3,personal,web3" --mine --miner.threads=1 --miner.gasprice 0
   

