---
date: 2021-08-03 23:43:00 +0900
title: "Weeknotes #81"
categories: ["weeknotes"]
---

- I received the second dose of the Moderna vaccine on Friday and felt incredibly lucky. I wish there were something like this available for kids in the age range of my children (0-5) but at least they're in the category with the lowest risk.

- In terms of side effects, it was really only a decent bout of lethargy on the day after. As I joked about at the time, given we have a newborn, feeling tired all the time is basically my default state. As Saturday progresses, though, it became clear that the lethargy I was feeling was meaningfully different. Fortunately, once I woke up on Sunday, I was back to normal.

- Since the side effects lasted a day, that's not the reason this is late. So what is? My Ruby-based Lisp interpreter. It's still very basic but I spent a good chunk of Monday getting it to the point where I could write `(.map [1 2 3] (fn* [n] (.+ n 1)))` and have it output `[2 3 4]`. This is significant because it's doing that without any core library. Instead, `fn*` is what's known as a special form (that is, an in-built function) and `.map` and `.+` are transformed during evaluation into calls to the Ruby methods [`Enumerable#map`](https://ruby-doc.org/core-3.0.2/Enumerable.html#method-i-map) and [`Integer#+`](https://ruby-doc.org/core-3.0.2/Integer.html#method-i-2B). I remained pessimistic about the practicality of this project and yet I feel this compulsion to complete it.

- Tokyo shattered the single-day detected cases record on Friday: 4,058 cases ([NHK News](https://www3.nhk.or.jp/nhkworld/en/news/20210731_19/)). In addition to being very lucky that I received my second shot of the vaccine on Friday, I'm also fortunate that I've been able to continue working from home.

- On the topic of infections, Emma, John and Rowan remain sick with the cold Emma brought home. Eri's took the kids at various stages to see our paediatrician and he reported that none of them are sick with anything especially serious. Hopefully, their recovery is swift (or at least swifter than it's been up to this point).

- I listened to all my outstanding podcasts! I honestly can't remember the last time this happened. It feels like I've always had the episode of another show to get through but at multiple points on the weekend, I found myself searching for episodes from shows that I no longer subscribe to but which I keep around in Overcast.

- I also discovered Pat Finnerty's 'What Makes This Song Stink' series. As of the writing of this entry, there are three episodes and I started with the [one on Weezer and 'Beverly Hills'](https://youtu.be/2WeEyncm_jQ) before going back and watching the other two. Finnerty does a great job making an engaging video essay while at the same time drawing attention to absurd elements of the form that we mostly all accept.

- The podcast progress is no doubt partly the result of Rowan's arrival but it's also partly to do with Eri and I not watching much TV of late (which, to be fair, is largely because of Rowan). I did watch an episode of _Law and Order_ for the first time in ages.

- Oh, and the Olympics are still happening. I did in spite of myself watch a little of the events that were being broadcast on Sunday morning. As much as I'm angry at the IOC and the Tokyo organisers for pressing ahead with the event, I do feel it's incredibly unfair that this happened to all the people who worked hard to stage a successful Olympics in Tokyo. It would have been nice if things were otherwise.

- Remember Morcheeba's 'Otherwise'? ([Apple Music](https://music.apple.com/us/album/otherwise/426592001?i=426592102))
