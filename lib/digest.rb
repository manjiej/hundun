require 'uri'
require 'net/http'
require 'json'

class Digest
  def self.digested title text

    url = "https://aip.baidubce.com/rpc/2.0/nlp/v1/news_summary?charset=UTF-8&access_token=24.1ea3089fa3c4d91ea21b83759caeaae1.2592000.1578482131.282335-17980393"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)

    # uri = URI("https://aip.baidubce.com/rpc/2.0/nlp/v1/news_summary?charset=UTF-8&access_token=24.1ea3089fa3c4d91ea21b83759caeaae1.2592000.1578482131.282335-17980393")

    request_data = {
    "title"=>title,
    "content"=>text,
    "max_summary_len"=>400,
    }

    request_json = JSON.generate(request_data)

    # request = Net::HTTP.post_form(
    #   uri,
    #   'Content-Type' => 'application/json',
    #   'Content' => request_json)

    response = Net::HTTP::Post.new(
    uri.request_uri,
    'Content-Type' => 'application/json',
    request_json
    )

    puts JSON.parse(response)
  end
end
