#!/bin/bash

source lib/common.sh

if [ ! -d "../ethereum-maker-ui" ]; then
	echo -e $RED"Source code for NodeManager UI not found in parent directory. Please clone ethereum-maker-ui."$COLOR_END
	exit 1
fi

rm -rf ethereum-maker-ui
cp -r ../ethereum-maker-ui ethereum-maker-ui

pushd ethereum-maker-ui > /dev/null

branch=$(git branch | grep \* | cut -d ' ' -f2-)
echo $CYAN"Building QM UI "$branch" ..."$COLOR_END
popd > /dev/null

docker run -it --rm \
    -v $(pwd)/ethereum-maker-ui/webApp:/ethereum-maker-ui \
    -w /ethereum-maker-ui \
    syneblock/cicd \
    /bin/sh -c 'npm install ; ng build --aot'

## Change the owneship of directory
chownDir 'ethereum-maker-ui'

echo $CYAN"Building QM UI "$branch" Completed."$COLOR_END