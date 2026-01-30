#!/bin/bash

# Video device (usually /dev/video0 for the first webcam)
VIDEO_DEVICE="/dev/video0"

# RTSP stream settings
RTSP_PORT="8554"
STREAM_NAME="webcam"

# Video settings
RESOLUTION="1280x720"
FRAMERATE="30"

# Start FFmpeg stream
ffmpeg -f v4l2 \
    -i "$VIDEO_DEVICE" \
    -input_format yuyv422 \
    -framerate "$FRAMERATE" \
    -video_size "$RESOLUTION" \
    -c:v libx264 \
    -preset ultrafast \
    -tune zerolatency \
    -f rtsp \
    rtsp://localhost:$RTSP_PORT/$STREAM_NAME
