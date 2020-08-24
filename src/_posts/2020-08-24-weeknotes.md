---
date: 2020-08-24 23:57:00 +0900
title: "Weeknotes #32"
categories: ["weeknotes"]
---

- It's not still not done yet but I'm getting close to finishing the first version of my iOS app. All functionality is now complete and I've spent the past couple of days finishing off things like the help documentation and the about screen.

- Looking back at the last couple of weeks of notes, I don't think I ever explained what the app actually does. Basically, it's a text processing utility. It comes with a set of 'processors': tools for transforming a body of text. One of the processors uppercases the first letter in every word. There are a few apps that do things like this already but the difference with mine is that users can add their _own_ processors to the app. All processors are merely JavaScript files, so if you write a file that exposes a particular JavaScript function, you can perform whatever transformation you want. 

- One thing I've spent a lot of time on is how best to display large amounts of text. One of the reasons the app has help documentation is that I needed to explain the requirements of the JavaScript function that needs to be in each processor. It turns out that despite being more than a decade old, iOS still doesn't have a great way to handle this. I vacillated between different options before deciding to go with Markdown files that are rendered at runtime unto HTML. These aren't as graceful as a purely native solution like attributed strings but they have more flexibility in the way that they look.

- A couple of weeks back, I heard an ad for the latest season of [Slow Burn](https://slate.com/podcasts/slow-burn/s4/david-duke) from Slate. The first and second seasons focused on Nixon and Clinton before the third season looked at Tupac Shakur. That one wasn't for me and I unsubscribed but in season four they've gone back to politics: this time focusing on the career of David Duke. I still miss Leon Neyfakh but am warming to Josh Levin.

- John started having difficulty speaking: he'd try to say words and would just get stuck. It sounded bad enough that Eri took him to two different doctors. The diagnosis: stress. John's natural disposition is exceptionally easy-going and I think he didn't have a great way to express his frustration at being stuck indoors for the past couple of weeks. The problem seems to have resolved itself for now, due in part it seems to the fact Eri took him out on the bicycle twice (to visit the doctors). We're going to be better at taking the kids out regularly. That's easier to do now that the weather has started to cool down.

- The latest addition to my music library is Phantom Planet's 'California' ([Apple Music](https://music.apple.com/us/album/california-tchad-blake-mix/169731518?i=169731532)). I've heard it before, although given that the song was originally released in 2002, I feel I should have more of a relationship to it than I actually do. I'm usually pretty good at guessing when Music was released but if you'd asked me about this one, I'd have guessed 2012.
