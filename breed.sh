# ffmpeg -re -stream_loop -1 -i demo_clips/catdog5.mp4 -c copy -an -r 1 -f rtsp rtsp://localhost:8554/breed
# ffmpeg -re -stream_loop -1 -i demo_clips/catdog_mobiledet_4secperframe.mp4 -c copy -an -f rtsp rtsp://localhost:8554/breed
# ffmpeg -re -stream_loop -1 -i demo_clips/catdog_valset.mp4 -c copy -an -f rtsp rtsp://localhost:8554/breed
# ffmpeg -re -stream_loop -1 -i demo_clips/catdog_valset_4sperimg.mp4 -c copy -an -f rtsp rtsp://localhost:8554/breed
ffmpeg -re -stream_loop -1 -i demo_clips/catdog_trainset.mp4 -c copy -an -f rtsp rtsp://localhost:8554/breed
# ffmpeg -re -stream_loop -1 -i demo_clips/catdog5.mp4 -c copy -an -r 0.25 -f rtsp rtsp://localhost:8554/breed
