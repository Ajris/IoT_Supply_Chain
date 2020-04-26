FROM ethereum/client-go
WORKDIR /privatenet
COPY genesis.json genesis.json
COPY password.best password.best
RUN mkdir data
RUN geth --datadir /privatenet/data/ init genesis.json 
RUN geth --datadir /privatenet/data/ --password password.best account new
