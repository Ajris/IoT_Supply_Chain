FROM ethereum/client-go
WORKDIR /privatenet
COPY genesis.json genesis.json
COPY password.best password.best
COPY start.sh start.sh
RUN chmod +x /privatenet/start.sh
RUN geth --datadir /privatenet/data/ init genesis.json 
RUN geth --datadir /privatenet/data/ --password password.best account new
