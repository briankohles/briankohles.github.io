---
title: New Apple Mac Hardware - me guessing
date: 2018-06-14
author: Brian Kohles
tags: Apple Mac Hardware
categories: Apple
layout:post
---

There has been a lot of speculation lately about Apple releasing new Mac hardware that switches from an Intel processor to a ARM processor (like the A10x in the iPad Pro).

The discussion usually revolves around how the transition would work, would there be an emulator, would they announce the change @ WWDC (they did not), what will it take for devs to update their apps, etc.

I was thinking about this today and I think there is an answer that would make everyone happy. The current line of Macs are all very old, almost like Apple has been waiting a long time to make any updates. Almost as though they want to update them all at the same time. Or at least have a viable plan to update them all in a very short (less than 1 year) timeframe.

At WWDC Apple announced that the Mac would soon be able to run iOS apps. It is expected that these apps would need to be recompiled to run on Intel CPUs as currently used in the Mac. It is also expected that if Apple switches the Mac to an ARM chip that there would need to be emulation of some sort (like Rosetta Stone during the transition to Intel) to allow older Mac apps to continue to run.

What if neither is true initially. Apple doesn't have to switch completely to ARM processors, what if they added additional hardware/software to allow an ARM processor to run the computer, but have an Intel co-processor for running old apps? There was a similar after market setup WAY back in the PowerPC days, you could buy a expansion card for your Mac (called a Power Card if I remember right), and that card was essentially a 386/486 PC on an expansion card. This allowed you to run windows inside a window on your Mac, almost as fast as an actual PC.

With Apple being in full control of their hardware and OS stack, why couldn't they do the same thing, but modernized? You could run the full blown Mac OS on either the Intel or ARM CPU (maybe you get to choose may be Apple chooses for you), and then essentially any apps that need access to the other CPU could just run in its own window. There would of course have to be a controller to manage data between the two processors, but it would work similar to handing off processing load to the GPU. The additional CPU would do its work & then hand the data back to the main CPU for rendering, or it could literally just draw its data right back to its own window.

With Apple relying so heavily on APIs for everything the OS does I could see this being a completely hands off process that the system just handles with little to zero input by the developer.

As apps are updated they could be compiled to run on the new CPU and eventually everything would use the new CPU & Apple could remove the Intel CPU from future hardware builds. Eventually Apple drops Intel, Intel probably goes under as a result & hopefully MS has Windows for ARM at the same level as their x86 version.