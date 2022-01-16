---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults
title: Home
layout: home
nav_order: 1
---
# Electaco
{: .no_toc }


Overlay for Guild Wars 2

{% include toc.html %}
## Description

This is an overlay for Guild Wars 2. It draws position-relevant data "into" the game world.
                
To accomplish this, it uses position data given by the game via an API called 
[MumbleLink](https://wiki.guildwars2.com/wiki/API:MumbleLink), and uses that to create 
a 3d drawing over the game.

For the moment this is used to draw markers for various things, and to put in videos "in" the game.

## Example footage
{% include youtube.html title="Early marker footage" id="fcdlP7xbfnY" %}
{% include youtube.html title="Video marker example" id="r649AJ6S1EU" %}

## Releases / Download

You can find the latest release at [https://github.com/electaco/overlay/releases](https://github.com/electaco/overlay/releases)

## Markes

Markers can be found at [https://elec.k.thelazy.net/markers/](https://elec.k.thelazy.net/markers/) - and can also be searched up and imported inside Electaco.

If you want to upload your marker packs there, give me a shout

### Video markes

The overlay support video markers, including HLS streaming video. For info about creating your own video markers, have a look at the 
[Video Markers]({% link _markers/video_markers/index.md %}) details page.

I have provided an example marker pack with two videos, which can be used to test the functionality and as a template for setting up a video marker yourself.
You can find it [here](https://elec.k.thelazy.net/markers/6)

## Why?

 Indeed, why. We have TacO, blish... Do we really need more? For me, it was mainly for experimenting and trying out things. I also have a different philosophy than them

 First of all, this solution is pretty "crazy", in that it uses web tech. React, threejs and electron are the main components. Using that for something like a 3d overlay was considered a bit of madness, and I admit it kinda was - especially at times. But it was fun, and it turned out much better than I expected to be honest.

 As a bonus the UI toolkit is very solid and quick to make new entries, and the threejs webgl engine is mostly pretty good to work with too. Which is important, seeing as I'm just one developer on this project, and most of my time is taken by other things.

 I also mentioned a different philosophy. Those projects are great, but they feel like they're "too much" in many ways. When I'm out in the game world and say.. wonder about a JP, I don't want to go on the web, find a big pack that include the jp I'm looking for, restart the overlay, get hundreds of different markers, go through menus enabling / disabling what I need.. I much more want to open markers, search just the jp, click one button to load it, and after just toss it away since I don't need it any more. I also want to have it easy to make your own markers and share it with others. 

## Contact

I set up a [Discord server](https://discord.gg/fNKWAPtJ9Z) for this project, you can contact me there.