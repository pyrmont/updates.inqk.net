---
date: 2020-03-16 09:48:00 +0900
title: "Weeknotes #9"
categories: ["weeknotes"]
---

- So way back in [#5](https://updates.inqk.net/post/1581898780.html), I wrote a reaction after news came out of domestic transmission of SARS-CoV-2 in Tokyo. The developments that happened this week in Italy and other countries in Europe is what I was half expecting Japan would experience next. And yet apart from the school closures and an increasing number of event cancellations, that still hasn't happened here. I remain at a loss as to why our situation hasn't trended in the same direction but maybe that's just a matter of time. 

- Our voluntary social distancing measures (and a brief snowfall in _March_!) meant another weekend with almost no outside activities. Emma and John have weathered it better than I expected. There's been some bouncing off the walls but much less than I feared.

- Did I mention that it snowed? In _March_?

- One thing that did conform to expectations was the amount of time I sunk into Pondent. The big new addition this week is arbitrary file uploads. That addition was hard fought. An embarrassing amount of time was spent on Friday trying to understand why the uploading of multiple files was producing an error on the GitHub side. It wasn't particularly verbose but seemed to indicate commits were failing because the repository was being updated too quickly. The solution was to cause the uploads to happen sequentially but that turned out to be more difficult to achieve than I would have thought. (My method was to return [a collection of functions](https://github.com/pyrmont/pondent/blob/6cc5a5057ee0fb3f3e0035548d0388272d650bee/src/pondent/pages/composer.cljs#L84-L92) that each create a JavaScript Promise rather than the Promises themselves.)

- Eri and I watched _Cool Runnings_ on Thursday night. As a kid, I remember hating that it ended the way that it did, having been conditioned to expect every Disney movie to conclude with an emphatically happy ending. As an adult, it's now my favourite part.

- OK, my favourite part is every time Doug E. Doug's Sanka refers to John Candy's character as 'sled god'.

- I showed Emma and John their first episodes of _Inspector Gadget_. I tried initially with the 2015 Netflix remake but it had too much going on (and doesn't use the theme song for reasons that should be the subject of an investigation in The Hague). The classic 1983 series was more attuned to their level. I think they thought it was all right but nothing on _PJ Masks_ or _Robocar Poli_.

- This is tangentially related to music but after being frustrated one too may times that Apple's Music app doesn't provide an easy way to get to their genre sections (they're buried in Browse) I decided to create [my first iOS Shortcut](https://www.icloud.com/shortcuts/0deae219be7e470f86a2cc37f824b8b0). It opens a link in Safari that automatically jumps you over to the jazz section of the Music app. A ridiculous series of steps but welcome to the future, I suppose.
