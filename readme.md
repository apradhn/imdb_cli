Intro
- :30
Problem: What could we build with our current knowledge?
Answer: Scraping CLI for IMDB
Reason: Both liked the scraping labs, and we wanted to get more comfortable with scraping and using
APIs. IMDB because it was fun and offered a lot of possibilities. And we both like movies!

Demo
- 1:00

Implementation
- scraper
  - scrapes the imdb home page
  - divided into opening, now playing, coming soon
- showtimes
- omdb
  - queries the omdb api to get information about movies
  - creates movie objects to pass to ui

- rotten tomatoes and youtube
  - rotten tomatoes class stores RT info and has a speak function
  - movies class stores info about a movie and has a youtube function
  - UI

Difficulties
- ascii, gem debugging, youtube
Lessons
- OOD, scraping, environment, experimentation, github collaboration

Future Plans
- find a gem for ascii that suited our needs, or create it ourselves
- figuring out open ssl issue for youtube
- future proof scraping so that if IMDB changes, it won't break
- improve reliability of showtimes scraper
