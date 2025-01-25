#!/bin/bash

if [ ! -d ~/Downloads/Music ]; then
    mkdir -p ~/Downloads/Music
fi

cd ~/Downloads/Music || return

# supported: vorbis, mp3, m4a, wav
format=vorbis
if ["$2"]; then
    format=$2
fi

yt-dlp --age-limit 18 "$1"

if hash aria2c 2> /dev/null; then
    yt-dlp --verbose --compat-options youtube-dl --force-ipv4 --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" --prefer-ffmpeg -f 171/251/140/bestaudio --extract-audio --audio-format "$format" --audio-quality 0 "$1"
else
    yt-dlp --verbose --compat-options youtube-dl --force-ipv4 --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" --prefer-ffmpeg -f 171/251/140/bestaudio --extract-audio --audio-format "$format" --audio-quality 0 "$1"
fi
