#!/bin/bash

# ==============================================================================
# MediaMTX and Assets Setup Script
# ==============================================================================

set -e

# Configuration
MEDIAMTX_VERSION="v1.9.3"
MEDIAMTX_DIR="mediamtx_rtsp_server"
DEMO_CLIPS_DIR="demo_clips"

# PLACEHOLDER: Update these URLs after uploading to GitHub Releases
# Example: https://github.com/pbseiya/rtsp-server/releases/download/v1.0.0/living.mp4
LIVING_MP4_URL="https://github.com/pbseiya/rtsp-server/releases/download/v1.0.0/living.mp4"
WALKING_MP4_URL="https://github.com/pbseiya/rtsp-server/releases/download/v1.0.0/walking.mp4"

echo "🚀 Starting setup..."

# 1. Setup MediaMTX
mkdir -p "$MEDIAMTX_DIR"
if [ ! -f "$MEDIAMTX_DIR/mediamtx" ]; then
    echo "📦 Downloading MediaMTX $MEDIAMTX_VERSION..."
    ARCH=$(uname -m)
    if [ "$ARCH" == "x86_64" ]; then
        URL="https://github.com/bluenviron/mediamtx/releases/download/$MEDIAMTX_VERSION/mediamtx_${MEDIAMTX_VERSION}_linux_amd64.tar.gz"
    elif [[ "$ARCH" == "aarch64" || "$ARCH" == "arm64" ]]; then
        URL="https://github.com/bluenviron/mediamtx/releases/download/$MEDIAMTX_VERSION/mediamtx_${MEDIAMTX_VERSION}_linux_arm64v8.tar.gz"
    else
        echo "❌ Unsupported architecture: $ARCH"
        exit 1
    fi
    
    wget -q --show-progress "$URL" -O mediamtx.tar.gz
    tar -xzf mediamtx.tar.gz -C "$MEDIAMTX_DIR" mediamtx mediamtx.yml LICENSE
    rm mediamtx.tar.gz
    echo "✅ MediaMTX installed in $MEDIAMTX_DIR/"
else
    echo "ℹ️ MediaMTX already exists, skipping download."
fi

# 2. Download Demo Clips (if missing)
mkdir -p "$DEMO_CLIPS_DIR"

download_asset() {
    local filename=$1
    local url=$2
    if [ ! -f "$DEMO_CLIPS_DIR/$filename" ]; then
        if [[ "$url" == "REPLACE_WITH_*" ]]; then
            echo "⚠️  Skip downloading $filename (URL not set yet)."
            echo "   Please upload $filename to GitHub Releases and update setup.sh"
        else
            echo "🎬 Downloading $filename..."
            wget -q --show-progress "$url" -O "$DEMO_CLIPS_DIR/$filename"
        fi
    else
        echo "ℹ️  $filename already exists, skipping."
    fi
}

download_asset "living.mp4" "$LIVING_MP4_URL"
download_asset "walking.mp4" "$WALKING_MP4_URL"

echo "🎉 Setup complete!"
echo "To start the RTSP server: cd $MEDIAMTX_DIR && ./mediamtx"
