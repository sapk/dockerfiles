#Cloud9 instance

Docker hub: https://registry.hub.docker.com/u/sapk/cloud9/
##Usage

    docker run -d -v $(pwd):/workspace -p 8181:8181 sapk/cloud9

##Start with auth

    docker run -d -v $(pwd):/workspace -p 8181:8181 sapk/cloud9 --auth username:password

You can also use any starting option describe in : https://github.com/c9/core
