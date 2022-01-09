---
title: ""
layout: single
draft: false
hideMeta: true
---

# Electaco

Overlay for Guild Wars 2

{{< my/toc >}}

## Description


This is an overlay for Guild Wars 2. It draws position-relevant data "into" the game world.
                
To accomplish this, it uses position data given by the game via an API called 
[MumbleLink](https://wiki.guildwars2.com/wiki/API:MumbleLink), and uses that to create 
a 3d drawing over the game.

For the moment this is used to draw markers for various things, and to put in videos "in" the game.

## Example footage

{{< sidebyside >}}
    {{< youtube id="fcdlP7xbfnY" title="Early marker footage">}}
    {{< youtube id="r649AJ6S1EU" title="Video marker example">}}
{{< /sidebyside >}}

## Releases

You can find the latest release at [https://github.com/electaco/overlay/releases](https://github.com/electaco/overlay/releases)

## Markes

Markers can be found at [https://elec.k.thelazy.net/markers/](https://elec.k.thelazy.net/markers/) - and can also be searched up and imported inside Electaco.

If you want to upload your marker packs there, give me a shout

### Video markes

The overlay support video markers, but it's a bit rough at the moment. 
You can change a position marker to a video marker in the Markers UI, and you then have the option to fill inn the video details.
The video also sometimes freeze if it's very quick marker updates, and only way to get it working again is to restart the overlay

I have provided an example marker pack with two videos, which can be used to test the functionality and as a template for setting up a video marker yourself.
You can find it [here](https://elec.k.thelazy.net/markers/6)

### HLS Source

The video stream also support HLS source, you need to link to the m3u8 playlist, and the type needs to be "application/x-mpegURL".

The easiest way I found to set up a server was to use Docker with [this image](https://github.com/JasonRivers/Docker-nginx-rtmp) and using [ffmpeg](https://ottverse.com/rtmp-streaming-using-ffmpeg-tutorial/) for streaming. [This](https://obsproject.com/forum/resources/rtmp-hls-stream-within-docker.368/) might also be an alternative.

## Why?

 Indeed, why. We have TacO, blish... Do we really need more? For me, it was mainly for experimenting and trying out things. I also have a different philosophy than them

 First of all, this solution is pretty "crazy", in that it uses web tech. React, threejs and electron are the main components. Using that for something like a 3d overlay was considered a bit of madness, and I admit it kinda was - especially at times. But it was fun, and it turned out much better than I expected to be honest.

 As a bonus the UI toolkit is very solid and quick to make new entries, and the threejs webgl engine is mostly pretty good to work with too. Which is important, seeing as I'm just one developer on this project, and most of my time is taken by other things.

 I also mentioned a different philosophy. Those projects are great, but they feel like they're "too much" in many ways. When I'm out in the game world and say.. wonder about a JP, I don't want to go on the web, find a big pack that include the jp I'm looking for, restart the overlay, get hundreds of different markers, go through menus enabling / disabling what I need.. I much more want to open markers, search just the jp, click one button to load it, and after just toss it away since I don't need it any more. I also want to have it easy to make your own markers and share it with others. 

## Contact

I set up a [Discord server](https://discord.gg/fNKWAPtJ9Z) for this project, you can contact me there.