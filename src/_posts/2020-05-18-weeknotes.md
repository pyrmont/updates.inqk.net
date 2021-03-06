---
date: 2020-05-18 10:25:00 +0900
title: "Weeknotes #18"
categories: ["weeknotes"]
render_with_liquid: false
---

- So this week I made yet another Janet library. This one is a partial implementation of the [Mustache](http://mustache.github.io) templating engine. Mustache is originally a Ruby library that allows you to take strings containing 'tags' and replace them with values. A tag is an identifier wrapped in `{{` and `}}`. So `"Hello, {{name}}"` might become `"Hello, Michael"`. There are plenty of alternatives; the appeal of Mustache is the simplicity of the syntax. There are no real logical control statements, like `if` statements or `while` loops. There are just tags.

- Oh right, the library itself. So it's called [Musty](https://github.com/pyrmont/musty). I primarily made it so that I could clean up the strings I was using in Documentarian to generate the Markdown page. Here's [the before](https://github.com/pyrmont/documentarian/blob/b0b35d43bb10201ecac6b92703162644f2b31e85/src/documentarian.janet#L142-L166) and [the after](https://github.com/pyrmont/documentarian/blob/3350674dc5edb9baaa97cd55c8651e01b1d8d630/src/documentarian.janet#L20-L44). I think it's a massive improvement.

- Another reason to use it was to learn how parser expression grammars (PEGs) work. These are similar to regular expressions but... better (or so it seems). Janet doesn't have built-in support for regular expressions so PEGs are what you have to work with if you want something more sophisticated than 1-to-1 string replacement. For those interested, there's [an actual paper](https://bford.info/pub/lang/peg.pdf) about them (which I haven't read) and [a blog post](https://bakpakin.com/writing/how-janets-peg-works.html) by the creator of Janet (which I have mostly read). I've been pretty impressed so far. With the caveat that it's only a partial implementation, PEGs are what allow Musty to be about 100 lines of code.

- I did take a bit of a break from programming to make a tiny dent in my backlog of articles to read. I enjoyed quite a few but want to highlight [this piece](https://www.theatlantic.com/ideas/archive/2020/05/americas-racial-contract-showing/611389/) by Adam Serwer about COVID-19 and the 'racial contract'. This was the first time I'd heard that term but it's an interesting concept.

- Speaking of backlogs, I've admitted defeat and created a new podcast playlist that doesn't include any of my basketball-related shows. This felt momentous because one of those podcasts, [Greatest of All Talk](https://goat.supportingcast.fm), is paid podcast that costs me $5 a month. I haven't got to the stage yet where I'm unsubscribing from these shows (and I'm still telling myself I will listen to them) but if I'm being honest, that's where this likely goes. This really is a 'not you, it's me' situation. There's nothing wrong with any of them, and I frequently enjoy listening to them, but they're typically upwards of 60 minutes and I'm finding it difficult to fit them into my drastically more homebound schedule.

- Eri and I started limiting the amount of YouTube that the kids watch in the evenings to one 10-minute video each. They had sometimes been watching up to an hour or so each night. The specific videos varied but toy-playing videos (I'm not sure if there's a term to describe it) make up the bulk. I'm not philosophically opposed to television—or YouTube—but I'm not convinced there's much educational value in these videos, consisting as they do of very little talking.

- One benefit of cutting back in this respect has been that we're getting the kids to bed earlier. Previously, they'd often not get into bed until 9, sometimes later. Now we've got it to be around 8.30. That's a special time for me because it was the time I needed to go to bed when I was a child. I don't think there was any real significance to that other than it was the time at which movies and TV programmes featuring more adult content would start being broadcast on free-to-air networks in Australia.

- I should note for posterity that the number of detected COVID-19 cases has drastically fallen in the past week to the single-to-low-double digits. The state of emergency that had been in effect throughout Japan has been lifted for all but seven of the prefectures. It seems likely that it will be lifted for Tokyo, too, sometime this week. I'm not sure yet what that will mean in terms of work.

- For perhaps the first time this week, I listened all the way through to Beck's _Colors_ album. It didn't grab me in the same way as some of his earlier work but I did listen to 'Up All Night' ([Apple Music](https://music.apple.com/us/album/up-all-night/1440881121?i=1273064253)) quite a few times.
