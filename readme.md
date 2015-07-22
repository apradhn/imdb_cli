#IMDB CLI
#### by Abhijit Pradhan and [Heather Petrow](https://github.com/hpetrow)
####for Flatiron Students Presents 6/23/15

IMDB CLI streamlines imdb.com into a simple, elegant command line interface. 
## Running IMDB CLI
To start using IMDB CLI, download the repository and run `$ ruby bin/runner.rb` to start the application.

## Features
### Opening, Now Playing, Coming Soon
* To view movies opening this week, enter `opening`. IMDB CLI will display a list of movies opening this week, e.g.
```
  + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
  +                                                               +
  +                   Movies opening this week                    +
  +                                                               +
  + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +

  1.  Ted 2 
  -----------------------------------------------------------------
  2.  Max 
  -----------------------------------------------------------------
  3.  Batkid Begins 
  -----------------------------------------------------------------
  4.  Escobar: Paradise Lost 
  -----------------------------------------------------------------
  5.  Big Game 
  -----------------------------------------------------------------
  6.  The Little Death 
  -----------------------------------------------------------------
  7.  A Murder in the Park 
  -----------------------------------------------------------------
  8.  Felt 
  -----------------------------------------------------------------
  ```
* To view a list of movies opening next week, enter `coming soon`, e.g.
```
  + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
  +                                                               +
  +                   Movies opening next week                    +
  +                                                               +
  + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +

  1.  Terminator Genisys 
  -----------------------------------------------------------------
  2.  Magic Mike XXL 
  -----------------------------------------------------------------
  3.  Cartel Land 
  -----------------------------------------------------------------
  4.  Jimmy's Hall 
  -----------------------------------------------------------------
  5.  Jackie & Ryan 
  -----------------------------------------------------------------
```
* To view a list of movies currently in theaters, enter `now playing`, e.g.
```
  + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +
  +                                                               +
  +                   Movies playing this week                    +
  +                                                               +
  + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + + +

  1.  Jurassic World 
  -----------------------------------------------------------------
  2.  Inside Out 
  -----------------------------------------------------------------
  3.  Spy 
  -----------------------------------------------------------------
  4.  San Andreas 
  -----------------------------------------------------------------
  5.  Dope 
  -----------------------------------------------------------------
```
 *   In the now playing section, enter the name of one of the movies on the list to see a listing of New York City showtimes:
 ```
   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
  #                                                               #
  #                 Regal Battery Park Stadium 11                 #
  #                                                               #
  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  3:30
  -----------------------------------------------------------------
  4:30
  -----------------------------------------------------------------
  7:20pm
  -----------------------------------------------------------------
  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
  #                                                               #
  #                      AMC Loews Village 7                      #
  #                                                               #
  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  12:55
  -----------------------------------------------------------------
  1:40
  -----------------------------------------------------------------
  3:30
  -----------------------------------------------------------------
  4:20
```
 
## Search
From the main menu, type `search` to open the search interface. Enter a search term, and the app will return an ordered list of search results.
```
  Enter the name of the movie you want to look up
  wargames
  1: WarGames (1983)
  -----------------------------------------------------------------
  2: WarGames: The Dead Code (2008)
  -----------------------------------------------------------------
  3: Wargames (1962)
  -----------------------------------------------------------------
  4: World of Wargames (2010)
  -----------------------------------------------------------------
  5: WWE: The Best of WarGames (2013)
  -----------------------------------------------------------------
  ```
Enter the corresponding number to read an imdb profile of a title:
```
  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
  #                                                               #
  #                           WarGames                            #
  #                                                               #
  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  Year: 1983
  Run Time: 114 min
  Genre(s): Sci-Fi, Thriller
  IMDB Rating: 7.1
  -----------------------------------------------------------------
  A young man finds a back door into a military central computer 
  in which reality is confused with game-playing, possibly start
  ing World War III.
  -----------------------------------------------------------------
  Enter 'trailer' to watch trailer, 'tomatoes' for Rotten Tomatoe
  s data, or 'back' to leave Search
  ```
### Youtube Trailer
After picking a title from search, enter `trailer` and the cli will open the title's trailer on Youtube in your default browser.
Note: some macs may not be able to use this feature due to a openSSL issue.
### Rotten Tomatoes
Enter `tomatoes` after picking a title, and your Mac's text-to-speech robot will speak the Rotten Tomatoes consensus of the title.

## UI customization
You can change the padding and width of the CLI by modifying th e `WIDTH` and `PADDING` constants in the Printable module. By default `WIDTH` and `PADDING` are set to 75 and 5, respectively.

## Resources
* [Nokogiri](http://www.nokogiri.org/)
* [OMDb API](http://www.omdbapi.com/)

## Thanks
* [Flatiron School](http://flatironschool.com/)