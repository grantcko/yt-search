# require 'dotenv/load'
require 'open-uri'
require 'json'

def search(query)
  unless query = query.gsub(' ', '\\ ')
    return puts 'ERROR: invalid'
  end

  # get top 10 results from youtube
  api_key = ENV[API_KEY]
  response = URI.parse("https://www.googleapis.com/youtube/v3/search?key=#{api_key}&q=#{query}&type=video&part=snippet").read
  data = JSON.parse(response)

  50.times { print '-' }

  index = 1
  titles = []
  urls = []

  data['items'].each do |video|
    # define name, desc, url for each video and display it
    title = video['snippet']['title']
    description = "  -  #{video['snippet']['description']}"
    url = "https://www.youtube.com/watch?v=#{video['id']['videoId']}"
    urls << url
    titles << title

    puts "\n[#{index}] - #{title} \n#{description}\n"
    index += 1
    50.times { print '-' }
  end

  puts "\n\nCHOOSE A NUMBER:"
  index = STDIN.getc.to_i - 1

  `yt-dlp -o '~/Downloads/%(title)s.%(ext)s' #{urls[index]} && mplayer ~/Downloads/#{titles[index].gsub(' ', '\\ ')}.gsub("\"", "\\\"").webm`
end
