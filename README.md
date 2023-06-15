# yt-search

Search for and download YouTube videos directly to your Downloads folder from the command line.

*STATUS: NOT WORKING SEE "ISSUES" BELOW*

## Dependencies

- `yt-dlp`
- `mplayer`
- YouTube Data API key
- run `bundle install` for gems

## Installation

1. Create an `.env` file in the project's top directory and set the `API_KEY` environment variable to your YouTube Data API key.
2. Navigate to the project's top directory.
3. Run `./yt-search` to test that the script is working correctly.
4. Once the script is working, you can add the `bin` directory to your system's `$PATH` environment variable to make the `yt-search` script executable from anywhere in the terminal.

## Usage

To use `yt-search`, simply run the `yt-search` command followed by your search query (in quotes). For example:

`yt-search “cute cats”`

This will search for videos matching the query "cute cats" and download them to your Downloads folder.

## ISSUES
.env file is not working. I'm trying to use [this gem](https://github.com/bkeepers/dotenv) but I haven't gotten it to work yet. The easiest solution is just to edit the `api_key` variable directly in `youtube-search.rb`
