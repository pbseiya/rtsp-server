cd ~/data/projects/aiml/flare/rtsp_server
ffmpeg -re -stream_loop -1 -i demo_clips/living.mp4 -c copy -an -f rtsp rtsp://localhost:8554/living
