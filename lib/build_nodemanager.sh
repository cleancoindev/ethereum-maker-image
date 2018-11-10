#!/bin/bash
source lib/common.sh

if [ ! -d "../ethereum-maker-nodemanager" ]; then
	echo -e $RED"Source code for NodeManager not found in parent directory. Please clone ethereum-maker-nodemanager."$COLOR_END
	exit 1
fi



rm -rf ethereum-maker-nodemanager
cp -r ../ethereum-maker-nodemanager ethereum-maker-nodemanager



pushd ethereum-maker-nodemanager > /dev/null

branch=$(git branch | grep \* | cut -d ' ' -f2-)
echo $CYAN"Building Node Manager "$branch" ..."$COLOR_END
popd > /dev/null

docker run -it --rm \
    -v $(pwd)/ethereum-maker-nodemanager:/go/src/github.com/synechron-finlabs/ethereum-maker-nodemanager \
    golang:1.10.2 \
    /bin/sh -c 'cd /go/src/github.com/synechron-finlabs/ethereum-maker-nodemanager ; go get ./... ; go build'

## Change the owneship of directory
chownDir 'ethereum-maker-nodemanager'

echo $CYAN"Building Node Manager "$branch" Completed."$COLOR_END