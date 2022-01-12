---
title: "Streaming Video"
layout: page
parent: "Video Markers"
---

# Streaming Video Setup

This explains setting up a HLS service, streaming video via it, and how to set that up in Electaco.

Please note that due to the technology involved, there is often a 10-20 second delay on the stream.

## Short overview
The video marker also support playing video from a [HLS](https://en.wikipedia.org/wiki/HTTP_Live_Streaming) source. For this you need to link to the m3u8 playlist, and the type needs to be "application/x-mpegURL".

The easiest way I found to set up a server was to use [Docker](https://www.docker.com/get-started) with [this image](https://github.com/JasonRivers/Docker-nginx-rtmp) and using [ffmpeg](https://ottverse.com/rtmp-streaming-using-ffmpeg-tutorial/) for streaming. 

[This OBS solution](https://obsproject.com/forum/resources/rtmp-hls-stream-within-docker.368/) might also be an alternative.

### Quickstart

#### Tools

You need these tools installed:

1. [Docker](https://www.docker.com/get-started) - a system for running pre-packaged services
2. [Python](https://www.python.org/downloads/) - A programming language runtime

#### Steps
When those two are installed, you can then:

1. Download [this zip file](/hls-streamer.zip) - it contains setup file for running the HLS service in docker, and 
a simple python script for streaming video files via ffmpeg

2. Open up a commmand line in the directory you unpacked the files to

3. Run the command `docker-compose up -d` to start downloading the service image and starting it up
    * The service defaults to two RTMP streams: "mystream" and "testing"
    * When running it has a web service at [http://localhost:8080/](http://localhost:8080/) where you can open the streams
4. To start a stream, run the command `py stream.py <path-to-video-file>` and shortly after the video should start playing on the web page listed above
    * Default target is "mystream", you can change to the testing screen by adding "--key testing" to the command

5. In Electaco, set the video url to `http://localhost/hls/mystream.m3u8` and the Type to `application/x-mpegURL`

6. To make this available from other machines, you need to set up port forwarding and use external address in the marker url

## Details

### Video Source - RTMP

First of all you need a video source that's capable of sending the video in [RTMP](https://en.wikipedia.org/wiki/Real-Time_Messaging_Protocol) format.


#### FFmpeg

[FFmpeg](https://ffmpeg.org/) is an all-in-one command line video tool 
that - among other things - support reencoding a video and sending it via RTMP.

FFmpeg have a lot of options for re-encoding and scaling video, and can do just about anything you'd want if you spend 
enough time tinkering with it, but for a quick start, you can do something like this:

    ffmpeg -re -i <inputfilename> -vcodec libx264 -vprofile baseline -g 30 -acodec aac -strict -2 -f flv rtmp://<streamtarget>

For more information about FFmpeg and using it, the [FFmpeg Recepies](https://ottverse.com/recipes-in-ffmpeg/) page is a good start.

#### OBS Studio

[OBS Studio](https://obsproject.com/) is a tool for screencasting and streaming desktop / games. It supports RTMP protocol

To use it, set the Stream server service to custom, and put in the RTMP link in "Server" and key in "Stream key".

### Streaming Server

While RTMP is excellent for streaming to few targets, 
it's less suited for many audiences and it's not well supported by web tools

For Electaco to read the live stream, it has to be converted to HLS format.

The easiest way to get running is via [Docker](https://www.docker.com/get-started), a software for running pre-packaged services.
With Docker installed, you only need to run this command to get a stream server running:

    docker run -p 1935:1935 -p 8080:8080 jasonrivers/nginx-rtmp

This will start up a HLS streaming server at port 8080, and an RTMP service on 1935 (default RTMP port). It will have these two streams:

* mystream:
    * RTMP: rtmp://localhost/live/mystream
    * Web: http://localhost:8080/hls/mystream.m3u8
* testing:
    * RTMP: rtmp://localhost/live/testing
    * Web: http://localhost:8080/hls/testing.m3u8    

For this to be accessible to others, you'll need:

1. Set up port forwarding to port 8080 on your machine
2. Use external network address instead of "localhost" in the url set in markers

Setting this up varies with your network setup and hardware, and is outside of the scope of this guide

### Using stream with a video marker

When the stream is set up and working, set the video url on the Video marker to 
`http(s)://<network address>/hls/<stream key>.m3u8` and the Type to `application/x-mpegURL`

The video should start playing shortly