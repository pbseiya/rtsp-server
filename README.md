# RTSP Server Project

A lightweight, automated RTSP server setup using [MediaMTX](https://github.com/bluenviron/mediamtx) and [FFmpeg](https://ffmpeg.org/). This project allows you to simulate RTSP video streams from local video files or a webcam.

## 🚀 Setup

This repository is designed to be lightweight. Large assets (MediaMTX binary, video files) are **not** stored in Git but are downloaded automatically.

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/pbseiya/rtsp-server.git
    cd rtsp-server
    ```

2.  **Run the setup script:**
    This script will detect your architecture, download the correct MediaMTX binary, and fetch the sample video files (`living.mp4`, `walking.mp4`) from GitHub Releases.
    ```bash
    ./setup.sh
    ```

## 🎥 Usage

To start streaming, you need to run the server first, and then publish a stream to it.

### Step 1: Start the MediaMTX Server
Open a terminal and run the local server:
```bash
cd mediamtx_rtsp_server
./mediamtx
```
*Keep this terminal open.* The server will listen on port `8554` (RTSP).

### Step 2: Publish a Stream
Open a **new terminal** and run one of the provided scripts to start streaming a video file to the server:

*   **Living Room Stream:**
    ```bash
    ./rtsp_living.sh
    ```
    *Source: `demo_clips/living.mp4` -> Path: `rtsp://localhost:8554/living`*

*   **Walking Stream:**
    ```bash
    ./rtsp_walking.sh
    ```
    *Source: `demo_clips/walking.mp4` -> Path: `rtsp://localhost:8554/walking`*

*   **Webcam Stream:**
    ```bash
    ./webcam.sh
    ```
    *Source: `/dev/video0` -> Path: `rtsp://localhost:8554/webcam`*

### Step 3: View the Stream
You can view the stream using VLC or `ffplay`:

```bash
ffplay rtsp://localhost:8554/living
# or
ffplay rtsp://localhost:8554/walking
```
