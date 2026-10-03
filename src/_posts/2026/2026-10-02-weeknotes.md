---
date: 2026-10-02 23:00:00 +0900
title: "Weeknotes #350"
categories: ["weeknotes"]
---

- I had been hoping to submit an application to renew my residency visa before 1 October when new fees that substantially increase the price for applications come into effect. Alas, as you might expect, everyone else also had this hope and I was unsuccessful.

  - Specifically, what happened was that I had planned to use the Immigration Services Agency’s website to lodge my application from the comfort of my very own home (I have not forgotten what happened [last time](https://updates.inqk.net/post/1638166500.html)). I had been organised enough to visit my nearby government office and get the documents I’d needed. On Monday, I opened up the Immigration Services Agency website and joined the Queue. (The agency had been organised enough to put in place CloudFlare’s waiting room system to ensure that everyone wasn’t simply hammering ‘refresh’ as hard as they could.)

  - That took seven hours but I got through and was all ready to make my application. Unfortunately, _I_ had not been organised enough to check whether I was going to need anything else. It turned out that before you can make an application through the website, you have to make an application to make an application through the website. I did that but, as of Friday 2 October, I still haven’t had that application be processed. I’m going to wait a day or two of next week to see if they get it done but if they haven’t, it looks like I will have to make the trek down to Shinagawa again.

- Obviously I should have made my website use application earlier. One of the reasons I had not done so was that I’ve been busy continuing work on [my fork of Janet](https://updates.inqk.net/post/1789740840.html). I think that’s sufficiently completed for me to give more details!

- [Wattle](https://github.com/pyrmont/wattle) is a Lisp-like programming language that reimplements Janet (the language I’ve used for most of my programming projects over this decade) in Zig (the systems programming language I’m most excited about) with the syntax of Clojure (my favourite programming language syntax). It’s the language that I have been meaning to make for about six years. I don’t know if it will ever be used by anyone other than me but I am expecting I’ll likely use it for any command-line tools I want to make in the future.

- Because Wattle’s runtime works very similarly to Janet’s, it’s been relatively straightforward to port two of my projects ([Blueshift](https://github.com/pyrmont/blueshift) and [Predoc](https://github.com/pyrmont/predoc)) over to it. The most attractive aspect of the language to me is that Wattle lets me write in a Lisp-like language and then generate self-contained executables that can be cross-compiled for different architectures. No longer do I need to worry about having the right version of Ruby installed on both my development machine and my production server. Instead, I can have a single file that I compile on my Arm-based Mac, send over to my Intel-based server and just run. Indeed, that’s what I’ve been doing with Blueshift [since Friday](https://updates.inqk.net/post/1790918296.html). It’s fantastic.

- If I’m being honest, the vast majority of Dan Barracuda’s 18-minute [breakdown of Jeff Buckley’s ‘Grace’](https://youtu.be/144O_bnkgIE?si=lspcOmwLJcdlgeiJ) went over my head. But Barracuda is so excited, and so talented, that I think if you like the original, you’ll enjoy the video.

- Conveniently, I have not linked to Buckley’s song ([Apple Music](https://music.apple.com/jp/album/grace/1046187510?l=en-US)). How does this [keep happening](https://updates.inqk.net/post/1790342280.html)? I really thought I must have linked to something from Buckley by now but no. I apologise for the error.
