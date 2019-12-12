require 'net/http'
require 'uri'
require 'json'

class Scrape
  def self.scrape(url)
    response = Net::HTTP.get(URI("https://api.diffbot.com/v3/article?token=606d0b61d6cf355ed6024deabc955e33&url=#{URI.encode(url)}"))
    parsed_res = JSON.parse(response)
    parsed_res["objects"][0]
  end

  def self.fetch(title, text)
    uri = URI('https://aip.baidubce.com/rpc/2.0/nlp/v1/news_summary?charset=UTF-8&access_token=24.1ea3089fa3c4d91ea21b83759caeaae1.2592000.1578482131.282335-17980393')

    body = { "title" => title, "content" => text, "max_summary_len" => 200 }.to_json

    response = Net::HTTP.post(uri, body, "Content-Type" => "application/json")

    JSON.parse(response.body)['summary']
  end

end
