#!/usr/bin/env bash

echo "Running docker-entrypoint.sh"

# only create a virtual framebuffer if there is not already a DISPLAY set
if [ -z "$DISPLAY" ]; then
	# create a virtual frame buffer for X11
	nohup Xvfb :99 -screen 0 1024x768x24 > /dev/null 2>&1 &

	export DISPLAY=:99.0
	echo "export DISPLAY=:99.0" > /etc/profile.d/01-export-virtual-display.sh
	chmod +x /etc/profile.d/01-export-virtual-display.sh
fi

exec "$@"
