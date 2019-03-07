# What is this?
* Docker container with [Scid_vs_pc](http://scidvspc.sourceforge.net/)
* Ubuntu 18.04 as the base image

# Functionality
* Goal is to have everything 100% working in Linux, MacOS and Windows as an easy alternative that is on-par with native installations. 

## Working:
### Linux
* Everything but the things on the To-Do list. 

## To-Do:
### Linux
* Xfcc support (implemented and should be working, but untested)
* Wayland support (should be working, but untested)

### MacOS
* Untested

### Windows
* Untested

# How to Run 
* Please make sure your engines/pieces/tablebases/etc are in the .scidvspc directory that is going to be mounted inside the container. This is the easiest way of getting everything to work. An alternative is to simply map your files separately inside the container.
* Edit the command below according to your needs and execute it.
```sh
docker run --rm -it -e DISPLAY=$DISPLAY \
        --name scidvspc-19 \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v /PATH/TO/.scidvspc:/home/scidvspc/ \
        -v /dev/shm:/dev/shm \
        -v /etc/machine-id:/etc/machine-id \
        -v /run/user/$UID/pulse/native:/tmp/pulse \
        scidvspc:4.19
```
# Suggestions/Improvements
* Please let me know if you run into any problems or have suggestions on how to improve this build.
