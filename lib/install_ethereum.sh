#!/bin/bash

source em.variables
source lib/common.sh 

echo $CYAN"Building Ethereum, "$ethereum_version"..."$COLOR_END

rm -rf ethereum

docker run -ti --rm -v ${HOME}:/root -v $(pwd):/git alpine/git clone https://github.com/ethereum/go-ethereum.git -b $ethereum_version
docker run -it --rm -v $(pwd)/go-ethereum:/go-ethereum -w /go-ethereum golang:1.11.2 make all

## Change the owneship of ethereum directory
chownDir 'ethereum'

echo $CYAN"Building Ethereum, "$ethereum_version" Completed."$COLOR_END
