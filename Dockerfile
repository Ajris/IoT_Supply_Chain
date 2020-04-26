FROM ethereum/client-go


WORKDIR /privatenet
COPY genesis.json genesis.json
RUN mkdir data
RUN geth --datadir /privatenet/data/ init genesis.json 
