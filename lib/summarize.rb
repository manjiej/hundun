require 'net/http'
require 'uri'
require 'json'
require 'aylien_text_api'


class Summarize

  class Tag
    def initialize(tags)
      @tags = tags.map do |tag|
        tag.slice("count", "label")
      end
    end

    def tags
      @tags.to_json
    end

  end

  def self.scrape url
    response = Net::HTTP.get(URI("https://api.diffbot.com/v3/article?token=a00edbe9025e886088f90b5642617651&url=#{URI.encode(url)}"))
    parsed_res = JSON.parse(response)
    parsed_res["objects"][0]
  end

  # def self.fetch(title, text)
  #   uri = URI('https://aip.baidubce.com/rpc/2.0/nlp/v1/news_summary?charset=UTF-8&access_token=24.1ea3089fa3c4d91ea21b83759caeaae1.2592000.1578482131.282335-17980393')

  #   body = { "title" => title, "content" => text, "max_summary_len" => 400 }.to_json

  #   response = Net::HTTP.post(uri, body, "Content-Type" => "application/json")

  #   JSON.parse(response.body)["summary"]
  # end
  def self.digest(title, text)
    client = AylienTextApi::Client.new(app_id: "20899059", app_key: "432a122614389fc3f8abf458d02ba93a")
    summary = client.summarize(title: title, text: text, sentences_number: 4)
    summary[:sentences].join(" ")
  end

  def self.info url
    client = AylienTextApi::Client.new(app_id: "20899059", app_key: "432a122614389fc3f8abf458d02ba93a")
    extract = client.extract(url: url, best_image: false)
    extract
  end

  def self.keyword url
    Tag.new(scrape(url)["tags"]).tags
  end


end
