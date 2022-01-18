---
date: 2022-01-18 23:35:00 +0900
title: "Weeknotes #105"
categories: ["weeknotes"]
---

- Our expression of interest in the property we were considering last week has put us into the running with a couple of other potential tenants. We were told we should have answer by sometime next (i.e. this) week. Fingers crossed.

- Emma's getting better at balancing while riding. I took her to a nearby park on Sunday and she was able to pedal for a couple of metres while remaining balanced. Even when she did start to fall over, she'd mostly remember to put her feet down to stop herself rather than just toppling over. Despite my initial pessimism maybe we only have a couple more weeks to go?

- There was an announcement that the Japanese Government would extend the entry ban on foreign non-residents to at least the end of February but that they would also be considering a relaxation of the that ban so as to allow some 'foreign family members' of Japanese nationals to visit Japan. Unfortunately, it was all exceptionally vague and so I don't know whether grandparents are covered and, even if they are, when this relaxed policy would be put in place.

- I came across [htmx](https://htmx.org) over the weekend and was immediately smitten. One of the deficiencies of Janet (especially with respect to Clojure) is that it doesn't have anything akin to ClojureScript. If I'm looking to do something that isn't entirely on the server, that's a bit of a problem. One potential solution is WebAssembly but even if you can overcome to technical hurdles with that approach (primarily [jumps](https://stackoverflow.com/questions/44263019/how-would-setjmp-longjmp-be-implemented-in-webassembly)), you'd still need a layer on top of that interacting with the DOM. htmx comes at the problem from a radically different direction, asking why HTML itself isn't sufficient? The answer of course is that basic HTML only offers two types of interactive controls—links and forms—and both of those require complete page reloads to update the DOM. htmx's core insight is that it's possible to provide a JavaScript library that enhances HTML, rather than one that replaces it. Like I said, I'm smitten.

- That said, htmx isn't a complete replacement, particularly for situations where you do want client-side interactivity. For that, the creator offers [hyperscript](https://hyperscript.org/). I'm not as immediately certain this is the answer but I'm excited enough about htmx that I'm willing to give this a shot.

- As I fell deeper and deeper down the htmx/hyperscript rabbit hole, I watched and listened to a bunch of presentations and interviews with said creator, Carson Gross. My favourite was this 18-minute presentation he gave at the JetBrains JavaScript Day 2021 ([YouTube](https://youtu.be/u2rjnLJ1M98)). If any of the above sounds remotely interesting, I'd encourage you to watch that.

- Like seemingly everyone else in my social class, I'm hopelessly addicted to [Wordle](https://www.powerlanguage.co.uk/wordle/) and, as of this writing, I've yet to lose a game. Indeed, the key impetus to go looking for something like htmx/hyperscript is that I started wondering if a Japanese-language version of the game was possible. There's no doubt something already out there but I thought trying to make something like that on my own would be a fun challenge.

- Craig Hockenberry, a longtime Mac and iOS developer, wrote a great post about Apple's ['consistency sin'](https://furbo.org/2022/01/11/consistency-sin/). I wish I had some insightful commentary to supplement it but I don't. I just hope that, as they did with their hardware, they realise they've gone down the wrong path in the last couple of years and undertake a major course correction.

- I haven't thought about them in ages but I found myself wondering about Razorlight the other day. I listened to their 2004 album _Up All Night_ ([Apple Music](https://music.apple.com/us/album/up-all-night/1443841895)) repeatedly when I first came to Japan to live in 2006 and putting it immediately threw me back to my memories of walking around Minoh. I'm still not sure why I didn't listen to anything they did other than this album.
