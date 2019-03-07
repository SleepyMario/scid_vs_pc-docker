# What is this?
* Docker container
* Scid_vs_pc
* Ubuntu 18.04
* Audio, etc. working

Scid_vs_pc in a docker container. Currently under construction, will be up very soon.


# Functionality
* Currently under construction. Goal is to have everything 100% working in Linux and MacOS (and maybe Windows).
## Working:
### Linux
* Main program
* Audio

### MacOS
* Not tested yet
 
### Not Working:
* Xfcc
* Gregor's tk::text patch
* engines as other containers.

# How to Run 
Edit the command below according to your needs and execute it. Engines can be mounted for now, separate docker support will be added in the future. 
```sh
docker run --rm -it -e DISPLAY=$DISPLAY \
        --name scidvspc-${PV} \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v /home/ashwin:/home/scidvspc \
        -v /usr/local/share/scid_vs_pc:/usr/local/share/scid_vs_pc \
        -v /dev/shm:/dev/shm \
        -v /etc/machine-id:/etc/machine-id \
        -v /run/user/$UID/pulse/native:/tmp/pulse \
        -v /usr/bin/stockfish:/home/ashwin/.scidvspc \
        scidvspc-test:latest
```
# Suggestions/Improvements
* Please let me know if you run into any problems or have suggestions on how to improve this build.
