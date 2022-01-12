---
title: "Creating a Video Marker"
layout: page
nav_order: 1
parent: "Video Markers"
---

# Video marker

## Creating a video marker

Here we'll show the steps needed to create a video marker in Electaco.

### Create marker

First step is to create a normal marker where you want the video to be. 
It doesn't have to be exact placement, as you can adjust the position manually later.

![create marker]({% link assets/images/video_markers/marker2.jpg %})


### Convert to video

After you have a marker in the general position of where you want the video, 
you can then expand it by clicking the + on the right side of the marker, 
and click the "To Video marker" button. 

![To Video marker]({% link assets/images/video_markers/marker3.jpg %})

The position rendering of the marker will disappear, the marker will get a different 
icon in the markers list, and it will have several more options.

![Video marker]({% link assets/images/video_markers/marker1.jpg %})

### Set Video URL and options

The minimum you need to do is to give it an url to a video. For a quick test you can use this url:

    https://test-videos.co.uk/vids/jellyfish/mp4/h264/720/Jellyfish_720_10s_1MB.mp4

As soon as you hit Enter the video should start playing! 

You can then use the Position, Rotation, Scale and Ratio options of the marker to adjust the placement of the video screen in game. 
Visible and Fadein distance determines the distance the video start playing, and while going between visible and fadein,
the video will be less and less transparent.

If you use a different video type than mpeg4, you also need to change the [MIME type](https://help.encoding.com/knowledge-base/article/correct-mime-types-for-serving-video-files/) 
to the correct format. Note that it uses Chrome's playback engine, so it's limited to formats Chrome supports.

## Your own videos

To host your own video, you first need to convert it to a suitable format (MPEG4 for example), and then you need to host it somewhere.

For testing and for just yourself, you can use local path in the URL box, but you're the only one that will be able to see that video.

### Converting the video

You need a HTML5 compatible video, and there's a lot of options here. You can for example use [Handbrake](https://handbrake.fr/) [(Guide)](https://www.wonderplugin.com/wordpress-tutorials/how-to-convert-video-to-html5-compatible/) or [FFmpeg](https://ffmpeg.org/), or any of the more advanced video suites.

### Hosting the video

For the video to be available for everyone, it needs to be put somehere that everyone can reach it. That's called hosting it.

There are many ways to host a video. You might already have a web page you can host it on. Or you can use for example [Github Pages](https://pages.github.com/) or [IPFS](https://ipfs.io/). 

There are also a lot of other free and paid hosting providers out there, many too many to go through here, but since the videos are static content
almost all hosting providers should be suitable.

#### IPFS

IPFS works with Electaco, but you need to use an Origin enabled gateway. [Public Gateway Checker](https://ipfs.github.io/public-gateway-checker/) has a list of gatweays, and also has Origin info.

You can read more about IPFS and Electaco at [this page]({% link _docs/video_markers/ipfs.md %})

## Streaming Video

Electaco also support streaming video from a HLS source.

[Video Streaming]({% link _docs/video_markers/videostream.md %})

## Troubleshooting

### Video stops playing

Sometimes when doing rapid adjustments to the video marker the video might stop playing. If that happens, just close and re-open the overlay.