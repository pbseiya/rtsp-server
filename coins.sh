ffmpeg -re -stream_loop -1 -i demo_clips/coins-h264.mp4 -c copy -an -f rtsp rtsp://localhost:8554/coins
