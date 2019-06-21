# Code Server (VSCode) instance

A Code Server instance with latest version from https://github.com/cdr/code-server

The goal is to provide the lightest possible image with some dev language preset. 

Latest is build on node:slim. 
Other tags exist ready for some programming language ([alpine](https://github.com/sapk/dockerfiles/blob/master/code-server/Dockerfile.alpine), [golang](https://github.com/sapk/dockerfiles/blob/master/code-server/Dockerfile.golang), [golang-alpine](https://github.com/sapk/dockerfiles/blob/master/code-server/Dockerfile.golang.alpine), [node](https://github.com/sapk/dockerfiles/blob/master/code-server/Dockerfile.node)), [node-alpine](https://github.com/sapk/dockerfiles/blob/master/code-server/Dockerfile.node.alpine)).

Docker hub: https://registry.hub.docker.com/u/sapk/code-server/

## Usage

### Start with auth

    docker run -d -v $(pwd):/workspace -p 8443:8443 sapk/code-server --allow-http --password password 
    
You can also use any starting option describe in : https://github.com/cdr/code-server/blob/master/doc/self-hosted/index.md


## Notes

If you want to only expose code-server localy use -p 127.0.0.1:8443:8443 instead of -p 8443:8443. Otherwise it will be accesible to any equipement that can acces to your PC through the network.

