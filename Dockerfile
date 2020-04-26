FROM ethereum/client-go
WORKDIR /privatenet
COPY genesis.json genesis.json
COPY password.txt password.txt
ARG name
ARG rpcport
ENV name $name
ENV rpcport $rpcport

RUN mkdir data
RUN geth init genesis.json
RUN geth --password password.txt account new
RUN geth --identity=$name --networkid=15 --verbosity=1 --mine --minerthreads=1 --rpc --rpcport=$rpcport --rpcaddr 0.0.0.0 --nodiscover --maxpeers=1 console

