ffmpeg -re -stream_loop -1 -i demo_clips/catdog1.mp4 -c copy -an -r 1 -f rtsp rtsp://localhost:8554/catdog
