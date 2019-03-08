# What is this?
* [Scid_vs_pc](http://scidvspc.sourceforge.net/) in a docker container
* Base image: Ubuntu 18.04

# Functionality
* Goal is to have everything 100% working with no noticeable difference from a native installations. 

## Working:
* Everything but the things on the To-Do list. 

## To-Do:
* Xfcc support (implemented and should be working, but untested)
* Test on MacOS

# How to Run 
* Please make sure your engines/pieces/tablebases/etc are in the .scidvspc directory that is going to be mounted inside the container. This is the easiest way of getting everything to work. An alternative is to simply map your files separately inside the container (tablebases come to mind).
* Edit the command below according to your needs and execute it.
```sh
docker run --rm -it -e DISPLAY=$DISPLAY \
        --name scidvspc-$BRANCH \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v /PATH/TO/.scidvspc:/home/scidvspc/ \
        -v /dev/shm:/dev/shm \
        -v /etc/machine-id:/etc/machine-id \
        -v /run/user/$UID/pulse/native:/tmp/pulse \
        scidvspc:$BRANCH
```
# Suggestions/Improvements
* Please let me know if you run into any problems or have suggestions on how to improve this build.
