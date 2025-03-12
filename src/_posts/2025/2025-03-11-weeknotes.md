---
date: 2025-03-11 20:48:00 +0900
title: "Weeknotes #269"
categories: ["weeknotes"]
---

- This is the first update I write in our new house. We did it! The idea that I own the building I am living in is a strange feeling to which I have not yet become accustomed.

- We moved in on Sunday and while there was a fair amount of stress in getting everything packed up before then, the move on the day itself went smoothly. I was worried that there might be issues getting our refrigerator and washing machine up to the second floor (where the kitchen and laundry are both located) but it all went so smoothly that the removalists had finished doing that while I was returning the car we hired for the short drive from our old apartment to the new house.

- Our unpacking is going slowly. There aren’t boxes literally everywhere but it feels like that. Part of the issue is storage. The aspect of the house I dislike the most is the lack of storage in the living room. We have some shelves and drawers but we’re used to having a fair number of built-in cupboards and our new kitchen has none.

- I wrote last week about the Janet programming I’d done but completely forgot that I released a new library! It’s called [Churlish](https://github.com/pyrmont/churlish) and is a(n incomplete) wrapper around the curl CLI tool. It enables a user to call out to curl and have it make an HTTP request. This is especially important in this age of every-HTTP-call-requires-TLS. Churlish wraps that all up so that you only need to worry about spelling the domain and path correctly. Indeed, the user is none the wiser that what's actually happening is that a process is being spawned to run the program in the background. Why is this such a big deal? Truth be told, it’s not really. There are other libraries for Janet that will wrap libcurl (the shared native library that programs can link against to provide the same functionality). The reason you might prefer Churlish is that, on the vast majority of machines, it doesn't require any additional packages to be installed; everyone has the curl CLI tool these days, even Windows! Packages that wrap libcurl need you to have the development package installed and also require a compilation step that links the Janet package against the native library. With Churlish, you download the code (probably via Curl!) and you're good to go.

- Ever since [I bought a Steam Deck](https://updates.inqk.net/post/1676250660.html), I've been looking for some kind of dock or stand to put it in. I've tried a few different ones over the years but nothing fit well. What I found on Amazon were phone stands that lacked the width necessary to provide a solid base. In the course of packing up the apartment, I discovered I'd had the perfect stand all along! The Wii U stand fits so perfectly it's like it was designed for it. If you own a Steam Deck and are looking for a great stand, see if you can find one on your auction website of choice.

- No TV or YouTube this week but I did enjoy two of Tim Harford's _Cautionary Tales_ episodes. The [first](https://timharford.com/2025/02/cautionary-tales-the-nursery-rhyme-that-ruined-a-rock-band/) was on the copyright infringement case involving Men at Work's 'Down Under' and the Australian classic, 'Kookaburra' ([Wikipedia](https://en.wikipedia.org/wiki/Kookaburra_(song))). The [second](https://timharford.com/2025/02/cautionary-tales-marty/) was on the 1955 film, _Marty_, starring Ernest Borgnine.

- I don't remember ever 'hearing' The Wiseguy's 'Start the Commotion' ([Apple Music](https://music.apple.com/jp/album/start-the-commotion/260027275?i=260030052&l=en-US)). It's just always been a song I remember being around. Nope. It's from 1998.
