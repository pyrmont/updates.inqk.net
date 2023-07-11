---
date: 2023-07-11 12:05:00 +0900
title: "Weeknotes #182"
categories: ["weeknotes"]
---

- It was all social all the time this week. I finally got an invite to Bluesky on Monday via [Scott](https://ohmypizza.com). My initial thoughts were that it was nice if a bit quiet. John Gruber really summed it up best when he quipped that Bluesky is for people who liked Twitter. As someone who did quite like Twitter, I appreciate some of its early decisions (notably quote-posts). I'm [@pyrmont.bsky.social](https://bsky.app/profile/pyrmont.bsky.social). 

- Of course, I didn't have much time to enjoy the afterglow of being in the cool club before Meta launched Threads on Thursday, obliterating any momentum that Bluesky had. While I prefer Bluesky's design (both in terms of the app and the protocol), Threads becoming the dominant short-form text posting app feels inevitable, even at this early a stage. My hope is that Meta does follow through with the promise to support ActivityPub and I can follow Threads accounts through something like Ivory. In the meantime, I'm [@pyrmont@threads.net](https://www.threads.net/@pyrmont) (God, Mastodon's fully-qualified usernames are so ugly).

- I lost two Wordles in a row! The first snapped my 294-game winning streak.

- I released [Digestive](https://github.com/pyrmont/digestive), a new Janet library! I mentioned [last week](https://updates.inqk.net/post/1688479560.html) that I wanted to implement the MD5 algorithm but had been unsuccessful because I needed unsigned 32-bit integer types and Janet only exposes signed 32-bit integers (it does have 64-bit integers as well but I was trying to avoid using those). Well, I somehow discovered that Janet can add 32-bit unsigned integers to a buffer (i.e. a byte array) and that started me wondering whether I could operate on the buffers directly. That meant needing to write my own bitwise functions—as well as an addition function (?!)—but it worked! I am _incredibly_ indebted to the pseudonymous sogaiu who developed [janet-checksums](https://github.com/sogaiu/janet-checksums) and generously shared some of his debugging output with me so I could track down where in the algorithm my code was breaking.

- Was that a good use of time? Probably not but I felt incredibly accomplished when it finally hashed my test string `hello` correctly. And I do have a much better understanding at this point of block ciphers, endianness and bit-numbering (Wikipedia entries [here](https://en.wikipedia.org/wiki/Block_cipher), [here](https://en.wikipedia.org/wiki/Endianness) and [here](https://en.wikipedia.org/wiki/Bit_numbering)).

- My favourite episode of _Peppa Pig_ is the 40th episode of season 5, 'Super Potato'. It is a masterwork of absurdist humour that I think is the height of the series and perhaps children's entertainment generally. It's on [YouTube](https://youtu.be/VrNULv4sJ4w).

- It's been a while since I've seen a video essay I really liked but I was pleasantly surprised by Patrick Willem's [recent essay](https://youtu.be/bbUHATtb6GU) on the film-making of Taylor Swift. Cynical attempt to cash in on the hottest person in popular culture? Maybe, but it's well done regardless. 

- This isn't really a video essay but I did find [this video](https://youtu.be/Alqt6RCEWdM) from Sam Denby of Wendover Productions explaining the backstory to Nebula quite informative. If, like me, you've wondered who they are (and you've got around half an hour), he does a decent job filling in the blanks.

- The final video of my YouTube infotainment trifecta is a [talk by Richard Feldman](https://www.youtube.com/watch?v=Tml94je2edk) about static typing. Feldman does a great job explaining why static typing declined in popularity and why it's rebounded. I particularly enjoyed his explanation for why he thinks it's very unlikely that dynamic languages will enjoy a resurgence.

- I finally made it to the [episode of _Hit Parade_](https://slate.com/podcasts/hit-parade/2023/05/how-britpop-ruled-90s-u-k-music) focusing on Britpop and it was as good as I'd hoped. It's had me listening to a lot of Britpop all week. I'll go with _Definitely Maybe_ as my selection for this week ([Apple Music](https://music.apple.com/us/album/definitely-maybe/1517506402)).
