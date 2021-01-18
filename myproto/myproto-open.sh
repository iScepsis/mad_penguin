#!/bin/bash

ffmpeg -video_size 1366x768 -framerate 5 -f x11grab -i :0.0+0,0 -t 00:01:00 ./Videos/output666.mp4
