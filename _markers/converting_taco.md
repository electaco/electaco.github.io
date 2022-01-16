---
title: "Converting TACO markers"
nav_order: 10
---

# Converting from TACO marker packs

This section is a bit technical, but it gives the basic tools to convert markers from TaCO marker packs to Electaco format.
## Converter script

In the installation folder of Electaco there is a small python script called `convert_from_taco.py` that will do most of the heavy lifting.
You will need [Python](https://www.python.org/downloads/) runtime installed on your system to run this script.

Note that this script is only tested on Tekkit's marker packs at the moment


## Taco marker packs

Okay, for the next steps to make sense we need some understanding of how the taco marker packs are built up.

First of all, the marker pack is just a zip file with a lot of files in it, so first step is to unzip it into a folder. 
Going into that folder you'll find some XML files

![xml]({% link assets/images/converting/xmls.jpg %})

## XML structure

Each of those XML files contains multiple marker groups. It has multiple sections, among others a section for taco menu entries called MarkerCategory and one for markers called POI.

When it comes to POIs there are generally two types. One is named poi's and the other is just a list of points with no unique identity to each.

Each POI has a type, that's connected to it's MarkerCategory. For unnamed POI's the type is the MarkerCategory names up to that option in MarkerCategory hierarchy.

### Example 1: Unnamed POIs - Sky Crystals

Here is the MarkerCategory info for Sky Crystals:
![markercategory]({% link assets/images/converting/xml1.jpg %})

You can see it's under `tw_guides`, then `tw_festival_fourwinds`, then `tw_festival_fourwinds_skycrystals_skycrystal`

And here is the connected POIs:
![poi]({% link assets/images/converting/xml2.jpg %})

The path for the Sky Crystals group is then `tw_guides.tw_festival_fourwinds.tw_festival_fourwinds_skycrystals_skycrystal`

### Example 2: Named POIs - Auric Basin Hero Points

Here is the MarkerCategory info for Auric Basin Hero Points:
![markercategory]({% link assets/images/converting/poi_named_category.jpg %})

As you can see, that has further one subcategory for each POI. 

![poi]({% link assets/images/converting/poi_named_poi.jpg %})

And each POI have their own unique type.

Here you want the MarkerCategory group path, not each individual POI's type. The path you're looking for here is `tw_guides.tw_hot.tw_hot_ab.tw_hot_ab_masterypoints`

## Running the script

Now that we've identified what we're looking for, it's time to use the script to convert it to a Electaco marker pack. The script takes first the XML file as parameter, and then the type to extract.

So for example to extract Auric Basin mastery points from the file `tw_exp01_hot02_auricbasin.xml` we'll run this command:

    py convert_from_taco.py tw_exp01_hot02_auricbasin.xml tw_guides.tw_hot.tw_hot_ab.tw_hot_ab_masterypoints

The script will then parse the XML and extract the points, and will give an output like this:

![script_output]({% link assets/images/converting/script_output.jpg %})

And when importing the file `Mastery Points.etmp` in Electaco you get this:

![markers]({% link assets/images/converting/imported_markers.jpg %})

If it's unnamed POI's the name for each marker will be MarkerCategory name plus a number.

### Cleanup

Sometimes the generated names are not that good, in that case the easiest way to fix it is to load the etmp file in a text editor and do search and replace. The format of the file is json.

## Troubleshooting

The XML parser used by the script is a lot stricter than Taco's parser, and sometimes you need to clean up the XML file a bit before it can parse it. Having an editor with good XML support makes that pretty straight forward.