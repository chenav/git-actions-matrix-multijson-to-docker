# git-actions-matrix-multijson-to-docker

This repo aims to demo the difficulty for a lot of developers, to use matrix in github actions with tools like docker
Actually, passing multiple JSONs to build image variants is a top feature that matrix allows
But, neither toJSON nor fromJSON functions are enough to easily fullfil such targets

Numerous developers fail doing so, because solutions are based on different usage of shell commands, in order to inline JSON to the command utilities like docker

In this example, based on the build of node-red docker images for industry, I tried to illustrate the different cases 
