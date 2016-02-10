#Cloud9 instance

Docker hub: [https://registry.hub.docker.com/u/sapk/cloud9/][1]
##Usage

    docker run -d -v $(pwd):/workspace -p 3131:3131 sapk/cloud9

##Start with auth

    docker run -d -v $(pwd):/workspace -p 3131:3131 sapk/cloud9 --auth username:password
