# require 'dotenv/load'
require 'open-uri'
require 'json'

def search(query)
  query = query.gsub(' ', '\\ ')
  index = 1
  api_key = ENV['API_KEY'] # NOT WORKING REPACE ME

  # from postman using youtube data api key
  response = URI.parse("https://www.googleapis.com/youtube/v3/search?key=#{api_key}&q=#{query}&type=video&part=snippet").read
  data = JSON.parse(response)

  50.times { print '-' }

  urls = []

  data['items'].each do |video|
    title = video['snippet']['title']
    description = "  -  #{video['snippet']['description']}"
    url = "https://www.youtube.com/watch?v=#{video['id']['videoId']}"
    urls << url

    puts "\n[#{index}] - #{title} \n#{description} \n\n #{url}"
    index += 1
    50.times { print '-' }
  end

  puts "\n\nCHOOSE A NUMBER:"
  index = STDIN.getc.to_i - 1

  `yt-dlp -o '~/Downloads/%(title)s.%(ext)s' #{urls[index]}`
end
