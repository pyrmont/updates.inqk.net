---
date: 2026-05-15 22:00:00 +0900
title: "Weeknotes #329"
categories: ["weeknotes"]
---

- We are in mid-May and the Strait of Hormuz is still closed. The Japanese snack food giant, Calbee (maker of many of my favourite flavours of potato crisps), announced that they would switch to black-and-white packaging due to rising costs related to the Iran War ([BBC](https://www.bbc.com/news/articles/c78k405j8pdo)).

- I mentioned [last week](https://updates.inqk.net/post/1778249520.html) that I have started to teach John how to ride a bicycle. This did not go especially well. In a move that I hope will not be scarring, I decided to take away John’s video game privileges until he improved the amount of ‘gliding’ down the very slight incline where we’re practising. I was worried this was putting too much stress on him but as the week progressed, his willingness to practise improved noticeably and he did start to get better. By Wednesday he was gliding for a couple of seconds at time and I deemed that worthy of the reward of a play session of _Princess Peach: Showtime!_.

- I will admit that one of the things that is making it difficult for John is that bicycle is too big. I worried about this at the time I bought it but deferred to the advice of the salesperson (who was obviously incentivised to tell me it was fine). I figured that even in the worst case where it was truly too big, John could grow into it. Still, as noted, we are making progress so that’s something.

- Crossmate continues to progress. Development bogged down a bit as I rearchitected the way remote moves are synced between players. My initial design had a separate row for each move in a table that was associated with each game. This led to a rapidly growing table as a game progressed and made things especially painful when joining a game from another device that was logged into the same iCloud account. Instead, I switched to an approach where each player in a game has a ‘moves’ log. Each player saves each of their moves to their log, these logs are synced between players and then Crossmate uses a reconciliation process to convert the logs into the game’s current state. I imagine most collaborative games are two players playing on their phones so now we’ve reduced all those separate move records to just two. It is true that there could be a fair amount of churn but I debounce updates as a player fills out squares and this limits the number of server pushes required. As neat as that sounds, it was only by around Friday that it felt like things were finally in a good place.

- I liked [this video](https://youtu.be/cIbCxbrBCys) from Mark Brown on his Game Maker’s Toolkit channel about how _Grand Theft Auto 3_ was able to fit Liberty City into the paltry memory of the PlayStation 2. I don’t think this will be of interest to someone with no affinity for video games but Brown does an exceptional job explaining technical details in a way that I think almost anyone can understand (while still having enough detail for a more technically-minded viewer). I was impressed enough that when I saw he had a [video about improving a UI element](https://youtu.be/cIbCxbrBCys) in the _Legend of Zelda: Echoes of Wisdom_, I sat John down in front of it and he watched the entire 24 minutes.

- Speaking of technically-minded viewers (or, I guess, in this case readers), I enjoyed [this post](https://tylerhillery.com/blog/why-dont-lowercase-chars-come-after-upper/) from Tyler Hillery about why there’s a ‘gap’ in between the lowercase and uppercase letters in the ASCII ordering system.

- Miike Snow’s 2016 hit ‘Ghenghis Khan’ came into my AirPods via some playlist and my goodness it’s catchy ([Apple Music](https://music.apple.com/jp/album/genghis-khan/1061243224?i=1061243229&l=en-US)).
