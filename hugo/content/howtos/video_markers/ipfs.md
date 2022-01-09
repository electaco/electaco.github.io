---
title: "Ipfs"
date: 2022-01-08T16:04:58+01:00
draft: false
---

[IPFS](https://ipfs.io/) or InterPlanetary File System is a distributed file system that can be used for hosting videos for a video marker. It has the advantage of being pretty straight forward to use and requires very little setup. 

IPFS works by you running a node on your machine, and upload files to that node. If someone else tries to access it, their node will first figure out who has the file and then contact that node and download it, temporarily storing it on their local node. If a third person then open the file, it will use it's local copy to help the third one get the file. 

Files you upload gets automatically "pinned", which means it'll never be removed from your node unless you delete or unpin it. There are also "pinning services" that also pins your content on their nodes, to provide extra robustness.

As with all things in life, there are a few drawbacks too. Electaco can't
talk directly with IPFS, and relies on a gateway to access the data. IPFS provides this, but the default one won't work with electaco and needs to be changed in the node's config *(or in the url given from the ipfs node)*.

This [Public Gateway Checker](https://ipfs.github.io/public-gateway-checker/) has a list of gatweays, for it to work with Electaco it needs a green checkmark on the Origin column.

Also, expect the first load to be slow since the gateway will have to find and copy the video from your node first. After that it should be fast as long as it's access semi-regularly.