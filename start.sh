PV=4.19
docker run --rm -it -e DISPLAY=$DISPLAY \
	--name scidvspc-${PV} \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v /home/ashwin:/home/scidvspc \
	-v /usr/local/share/scid_vs_pc:/usr/local/share/scid_vs_pc \
	-v /dev/shm:/dev/shm \
	-v /etc/machine-id:/etc/machine-id \
	-v /run/user/$UID/pulse/native:/tmp/pulse \
	-v /usr/bin/stockfish:/home/ashwin/.scidvspc \
	scidvspc:4.19
