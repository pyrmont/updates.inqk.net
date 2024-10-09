---
date: 2024-10-08 23:21:00 +0900
title: "Weeknotes #247"
categories: ["weeknotes"]
---

- A couple of weeks ago, Brandon [mentioned](https://sangsara.net/2024/09/23/week-38-24/) that he’d installed a shortcut into the redesigned Control Centre in iOS 18 that he used to launch his personal Apple Music radio station. I don’t know why it took multiple weeks but it occurred to me that I could add a button for a shortcut that began my Japanese study timer in [Awesome Habits](https://www.awesome-habits.com) and then opened [Kanshudo](https://kanshudo.com) in a new Safari tab. Given my Japanese studying history to this point, I wouldn’t hold my breath but in the past week, I’ve only missed a single day.

- As I always am, I was [immediately frustrated](https://updates.inqk.net/post/1727915520.html) that I couldn’t get the shortcut to actually do what I wanted. At the moment, it just opens Kanshudo in a new tab regardless of whether I _already_ have a Kanshudo tab open. Unfortunately, Safari just won’t give you a list of open tabs so that’s the best you can do. How is the system still so limited after all these years?

- It was a ‘finally’ kind of day because the same day I wrote the shortcut was also the same that I managed to get Time Machine working with a [sparse bundle disk image](https://en.wikipedia.org/wiki/Sparse_image) on my external drive. For anyone interested (or me in the future), there were five steps:

  1. Create the sparse bundle disk image. This can be done in Disk Utility.

  2. Mount the disk image. Run this command in Terminal: `hdiutil attach </path/to/sparse/bundle/image>.sparsebundle`.

  3. Tell Time Machine to use this disk image. Run this command in Terminal: `sudo tmutil setdestination /Volumes/<VolumeName>`.

  4. Create an Automator action. macOS won’t automatically mount the disk image on restart, so you have to do this yourself. My preferred option was to create an Automator ‘app’ that merely runs the ‘shell script’ `hdiutil attach </path/to/sparse/bundle/image>.sparsebundle` from Step 2.

  5. Run the Automator action on login. In Settings > General > Login Items & Extensions, you need to add the Automator app you created in Step 4.

  Not exactly the most straightforward process but I now have a Time Machine backup that my Mac backs up to without me needing to do anything.

- I like to go on 30-minute or so walks at lunch time for exercise. On one of the days I was in the office last week, I stumbled across a strange compound in Akasaka/Roppongi. At first, I wondered if it were a prison but after further research it appears to be the ‘living quarters’ for the U.S. diplomatic presence in Tokyo. I can’t find any information in English but the compound itself seems to be known as Mitsui Gardens. There’s a small bit of information (in Japanese) about it on [this website](https://skyscraperclub.com/?p=12100).

- Paul Battley used 'ablation' in a recent [weeknotes](https://po-ru.com/2024/10/02/week-195-bristol) and I believe that’s the first time I’ve ever seen the word in my life. It means the surgical removal of tissue or the removal of snow and ice by melting or evaporation.

- Speaking of Brandon, we were talking on FaceTime last week and for reasons that I’ve already forgotten the conversation turned to Lionel Ritchie. I mentioned how, while I didn’t consider this a remotely objective opinion, I couldn’t stand him because one of the first (and it felt only) CDs my parents owned when I was a child was an album of his that I must have listened to approximately seven hundred million times (I’m sure it was less than 10). ‘_Back to Front_?’ Brandon asked ([Apple Music](https://music.apple.com/us/album/back-to-front/1440832099)). The scars immediately reopened.
