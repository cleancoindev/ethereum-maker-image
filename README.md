# Ethereum Maker Docker image building utility #

Ethereum Maker uses Docker to make the setup easy. Most of the dependancies are baked into the image, so users can get going without having to download and install a list of dependancies. If you want to use a different version of these dependancies other than officially supported by Ethereum Maker, build the docker image locally and use with Ethereum Maker. 

> **Usage of Ethereum Maker image building utility is optional. The official docker image is uploaded in docker hub.**
## Quick Start ##
1. Create a temperory directory and clone following three projects
   1. `mkdir qmtemp; cd qmtemp ` 
   1. `git clone https://github.com/synechron-finlabs/ethereum-maker-nodemanager.git`
   1. `git clone https://github.com/synechron-finlabs/ethereum-maker-ui.git`
   1. `git clone https://github.com/synechron-finlabs/ethereum-maker-image.git` 
   1. Ethereum Maker project is not required to build docker image as it is required only at runtime. 
1. Run `./build_image.sh` inside `ethereum-maker-image` directory. Following are the steps executed automatically by this script. 
   1. Automatically build ethereum-maker-nodemanager using Golang and copy the executable to image.
   2. Automatically build ethereum-maker-ui using Angular and copy HTML, JS, CSS and images. 
   3. Automatically clone Ethereum and copy `geth` and `bootnode` to image.
   4. Install Linux libraries.
1. Tag docker image
   * Ethereum maker follows below convention for naming docker image
   syneblock/ethereum-maker:`<ethereum-version>`_`<ethereum-maker-version>`  

   E.g. If Ethereum version is 1.8.17 and Ethereum Maker version is 1.1, the docker image tag by convension is **syneblock/ethereum-maker:1.8.17_1.1**
   
   * You can pass the name and tag of the docker image as the parameter to the `build_image.sh` script.  

   E.g. `build_image.sh my-ethereum-maker` or `build_image.sh my-ethereum-maker 1.9_2.0`

   * If you do not pass any parameters, `build_image.sh` will use the git branch for the Ethereum Maker part of the tag name. 

   E.g. If you are V1.0 branch, the generated image name will be **syneblock/ethereum-maker:1.8.17_1.0**

   > Branches `development` and `master` are treated specially.  


Please refer to the source code and edit each libraries versions before you build. Make sure to update the image tag name in em.variables of Ethereum Maker to use this newly built image.  
