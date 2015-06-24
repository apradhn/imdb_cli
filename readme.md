#IMDB CLI
#### by Abhijit Pradhan and Heather Petrow
####for Flatiron Students Presents 6/23/15

IMDB CLI streamlines imdb.com into a simple, elegant command line interface. 

## Running IMDB CLI
To start using IMDB CLI, download the repository and run `$ ruby bin/runner.rb` to start the application.

## Features
### Opening, Now Playing, Coming Soon
* To view movies opening this week, enter `opening`. IMDB CLI will display a list of movies opening this week. 
* To view a list of movies opening next week, enter `coming soon`
* To view a list of movies currently in theaters, enter `now playing`
 *   In the now playing section, enter the name of one of the movies on the list to see a listing of New York City showtimes
 
## Search
From the main menu, type `search` to open the search interface. Enter a search term, and the app will return an ordered list of search results. Enter the corresponding number to read an imdb profile of a title.
### Youtube Trailer
After picking a title from search, enter `trailer` and the cli will open the title's trailer on Youtube in your default browser.
Note: some macs may not be able to use this feature due to a openSSL issue.
### Rotten Tomatoes
Enter `tomatoes` after picking a title, and your Mac's text-to-speech robot will speak the Rotten Tomatoes consensus of the title.

## Resources
* [Nokogiri](http://www.nokogiri.org/)
* [OMDb API](http://www.omdbapi.com/)

## Thanks
* [Flatiron School](http://flatironschool.com/)