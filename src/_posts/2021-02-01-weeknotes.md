---
date: 2021-02-01 23:56:00 +0900
title: "Weeknotes #55"
categories: ["weeknotes"]
---

- I was somewhat dismayed at the schedules being discussed for the rollout of a COVID-19 vaccine in Japan ([New York Times](https://www.nytimes.com/2021/01/31/world/asia/japan-south-korea-vaccinations.html)) and it's causing me to lose confidence in my belief that, if nothing else, the Japanese corporate sector would pressure the Government into moving quickly to get everyone vaccinated.

- I forgot to say last week that I'd been working on [Tomlin](https://github.com/pyrmont/tomlin), a a TOML parser written in Janet. I didn't have a particularly good reason to want a TOML parser but I'd found myself reading the specification and wondering how difficult it would be to translate an [ABNF grammar](https://github.com/toml-lang/toml/blob/1.0.0/toml.abnf) into a parser expression grammar. Not that difficult it turns out!

- Indeed, the bit that took the most time was writing a series of conformance tests. There's no complete official test suite at the moment but there are plans for how the tests in that suite would be written. For reasons that now escape me, I took the most common test suite I could find on GitHub and rewrote—by hand!—all those tests into the aforementioned format. I did submit that work as a [pull request](https://github.com/toml-lang/compliance/pull/8) to the main repo so hopefully it's something that will benefit others.

- So that was last week, _this week_ I finally devoted some attention to [Watchful](https://github.com/pyrmont/watchful), my file watching library (intended for use as a Janet library but written mostly in C). It was sort of working in very 'bare bones' kind of way but I went in wrote proper tests, got it to pass the tests on both Linux and macOS and built out more functionality (notably proper support for ignoring particular types of events). I need to try using it in something real (like Ecstatic) but it's definitely significantly improved from where it was.

- As might be expected with all that programming, I didn't spend much time this week on reading. Although, [this series of articles](https://www.axios.com/off-the-rails-episodes-cf6da824-83ac-45a6-a33c-ed8b00094e39.html) from Axios is a chilling reminder of how close Trump came to causing even more havoc before Biden's inauguration.

- Speaking of crazy things from television, I was reminded once again of the delightful absurdity of _SpongeBob SquarePants_. I consider myself something of an amateur student of comedy and as Eri and the kids were watching episodes during the week it became apparent what a very strange combination of childish and sophisticated (primarily absurdist) humour that show is. This led to a discussion at one point with Eri about whether there was such a tradition in Japanese comedy and our conclusion was that there wasn't. That may merely reflect our limited perspective.

- Speaking of crazy things from television (still), Nadia shared a [tweet about _Inspector Gadget_ and the Japanese manga character, Lupin III](https://twitter.com/dokidokigalaxy/status/1351009703850074124), that I immediately found suspect. I went and watched the [YouTube video](https://youtu.be/uFqzJKxPkOg) that was the alleged source and while I think the tweet is misleading, the origins of _Inspector Gadget_ were far stranger than I had realised. I don't know who else is up for a 50-minute documentary about an 80s cartoon but if that sounds like you, I heartily recommend it.

- I assume Maroon 5 has only become _less_ cool over the years but I heard 'Harder to Breathe' ([Apple Music](https://music.apple.com/us/album/harder-to-breathe/1440851650?i=1440851717)) in some auto-generated playlist of music I might like and damn if they can't write a catchy hook. Nadia was also hand with [this tweet](https://twitter.com/alexwatt187/status/1353838553600569344).
