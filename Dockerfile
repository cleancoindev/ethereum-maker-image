FROM ubuntu:16.04
ADD lib/install_baseimage.sh /root/ethereum-maker/install_baseimage.sh
RUN /root/ethereum-maker/install_baseimage.sh

ADD go-ethereum/build/bin/geth /usr/local/bin
ADD go-ethereum/build/bin/bootnode /usr/local/bin

ADD ethereum-maker-nodemanager/ethereum-maker-nodemanager /root/ethereum-maker/NodeManager
ADD ethereum-maker-ui/webApp/dist /root/ethereum-maker/NodeManagerUI

ADD lib/start_nodemanager.sh /root/ethereum-maker/start_nodemanager.sh
RUN chmod +x /root/ethereum-maker/start_nodemanager.sh

ADD lib/reset_chain.sh /root/ethereum-maker/reset_chain.sh
RUN chmod +x /root/ethereum-maker/reset_chain.sh

ADD ethereum-maker-nodemanager/NetworkManagerContract.sol /root/ethereum-maker/NetworkManagerContract.sol
ADD ethereum-maker-nodemanager/NodeUnavailableTemplate.txt /root/ethereum-maker/NodeUnavailableTemplate.txt
ADD ethereum-maker-nodemanager/TestMailTemplate.txt /root/ethereum-maker/TestMailTemplate.txt
ADD ethereum-maker-nodemanager/nmcBytecode /root/ethereum-maker/nmcBytecode
