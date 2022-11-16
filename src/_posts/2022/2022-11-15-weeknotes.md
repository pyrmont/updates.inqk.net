---
date: 2022-11-15 23:28:00 +0900
title: "Weeknotes #148"
categories: ["weeknotes"]
---

- I received my fourth dose of a COVID-19 vaccine on Sunday, this time receiving the Pfizer bivalent booster that targets both the original strain as well as the BA.4/BA.5 Omicron variant. This is my first Pfizer injection and, so far, no side effects. No lethargy like the kind I experienced after the second and third shots of the Moderna vaccine, in particular.

- Ukrainian forces retook Kherson which feels like a big deal ([ABC News](https://www.abc.net.au/news/2022-11-12/how-important-russia-retreat-kherson-kyiv-moscow-putin-zelenskyy/101646774)). It still seems inconceivable to me that Ukraine can really push Russia out of the areas of Ukraine that it annexed back in September but maybe that should be considered a real possibility at this point.

- The ongoing car crash that is Elon Musk's tenure as CEO of Twitter continued unabated. I agree with everyone who has said that alternatives like Mastodon will never replicate the best parts of Twitter but I nevertheless made ready to leave and paid for the account [@pyrmont](https://social.lol/@pyrmont) at [social.lol](https://social.lol). It's run by the guy that runs [omg.lol](https://omg.lol) and the paid-only nature of the instance appealed to me.

- In tandem with that, I extended my custom Jekyll plugin that I use to cross-post to Twitter. It now cross-posts to Mastodon as well. I also improved the custom Jekyll plugin that allows me to @mention people in a service-agnostic way. This means that posts that go to Twitter will use links for non-Twitter @mentions and posts that go to Mastodon will format the @mention to `@username@service`.

- Speaking of Twitter, [this tweet](https://twitter.com/bgsprung/status/1591497637680799745) is the kind of thing I'll really miss. (The tweet is a screenshot of a random comment on a YouTube video about the etymology of the word 'the' when used in phrases like 'the more, the merrier'.) Fascinating stuff.

- I went back to the drawing board with my todo app and started playing around with animations of views in SwiftUI. I eventually came across the [`matchedGeometryEffect` modifier](https://developer.apple.com/documentation/swiftui/view/matchedgeometryeffect(id:in:properties:anchor:issource:)) which seems to what I need to make SwiftUI treat two different views as different manifestations of the same view. In short, it tells SwiftUI to treat their respective appearances and disappearances from the view hierarchy as transitions from one location to another that should be animated. The one limitation is that it doesn't work properly with SwiftUI's `List` view and so I've had to 'roll my own' list view out of a `VStack` wrapped in a `ScrollView`. The good news is that I have animated transitions working with swiping gestures. The bad news is that I will have to write the logic for implementing drag and drop by myself (you get it for free with `List`).

- I watched Jenny Nicholson's 3-hour and 48-minute [epic investigation of the Evermore theme park](https://www.youtube.com/watch?v=L9OhTB5eBqQ). Unless you're a super fan of Nicholson (or, I guess, theme parks), I wouldn't really recommend it. Nicholson's deconstruction is surprisingly engaging given the running time but you're still talking about spending almost four hours of your life watching a video essay about a Utah theme park you're never going to visit.

- A much better use of your time is [James Acaster's recent appearance](https://www.youtube.com/watch?v=q5UsZ2YdyKE) on _Late Night with Seth Meyers_. It runs for less than nine minutes and genuinely had me in tears.

- HBO cancelled _Westworld_. Season four was wrapped up in such a way that it's not a huge shame but hope sprung eternal that a new season might see the producers some how make it back to the heady heights of season one. Alas.

- My latest earworm has been 'Weekend Vibe' by Jubël ([Apple Music](https://music.apple.com/us/album/weekend-vibe/1568521700?i=1568521871)). Pure Swedish bubblegum.
