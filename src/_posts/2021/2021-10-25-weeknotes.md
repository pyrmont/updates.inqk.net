---
date: 2021-10-25 11:20:00 +0900
title: "Weeknotes #93"
categories: ["weeknotes"]
---

- The number of detected COVID-19 cases continues to be very low in Tokyo.

- Eri received her second shot and is now double vaccinated! In some ways it will hopefully work out well because she's now at the maximum level heading into winter. It looks like booster shots are going to be offered eight months after vaccination ([NHK News](https://www3.nhk.or.jp/nhkworld/en/news/backstories/1792/)) so for me that means I'll have to wait til sometime next February.

- Apple held an event to tell everyone about the new MacBook Pros and (_finally_) the new AirPods. I ordered the AirPods as soon as Apple's website was updated and they're scheduled to arrive on Tuesday. I don't even remember how long I've been waiting now but they can't come soon enough. I dropped my iPhone for the first time on Friday because the corded headphones I was wearing got caught on a chair and yanked the phone from my pocket. The new laptops look really good, too (even if that's mostly because they've undone all the design changes they made when they redesigned them in 2016). If I didn't keep my existing MacBook Pro 13" docked all the time, I'd be very tempted to upgrade. As it is, I think the right choice is to wait for the Mac Mini to get refreshed either next year or the year after and get that instead.

- The NBA is back! I didn't think I'd really be that interested given the San Antonio Spurs [aren't projected to do much](https://www.washingtonpost.com/sports/2021/10/11/nba-rankings-entertaining-teams/) but I tuned into the opening game against the Orlando Magic and it was a lot of fun! It probably is the case that the team won't amount to much this season but now that they've basically dispensed with all their veterans, the team moves and is much closer to the 2014 'beautiful game' Spurs that I loved.

- The weather was nice over the weekend and I went with Emma and John to Chuo Park again. Having the kids be able to walk a decent distance (it's more than a kilometre) has definitely opened things up a little.

- I fundamentally changed the way Watchful's Janet wrapper communicates between the thread that's handling event notifications and Janet itself. Previously, I was communicating messages by serialising them into strings and sending those over a pipe between the threads. That was relatively straightforward in concept but became increasingly difficult to extend as I wanted to add additional information to messages. After becoming particularly frustrated at how difficult it was to add a timestamp to a message, I decided to see if I couldn't instead send a message directly to Janet's event loop. It turns out I could! Just look at all that [deleted code](https://github.com/pyrmont/watchful/commit/fdd6eb4213006d9fa9857a800a90d3ff81ac868a#diff-c60cd9595701790963b91d32d8f9d59b7849f6de8f1d3f7e7dc93a4db14d89b5)!

- Lindsay Ellis released a [video essay on _Love Never Dies_](https://www.youtube.com/watch?v=Pfz-WxGu3Y), the sequel to the _Phantom of the Opera_. It's a clever tie-in to the release of _Truth of the Divine_, the sequel to her first novel. I purchased it but—if I'm being honest—I'm very unlikely to read it any time soon. I only noticed this week that my Kindle has needed charging for God knows how long.

- Speaking of new releases, RÜFÜS DU SOL is one of my favourite electronic acts and I enjoyed their new album, _Surrender_ ([Apple Music](https://music.apple.com/us/album/surrender/1585865534)).
