require 'uri'
require 'net/http'
# require 'pry-byebug'

class SummarizeJob < ActiveJob::Base
  queue_as :default

  def perform
    summaries = Summary.where("title": "")
    summaries.each do |summary|
        @summary = summary
        @data = data

        summary.update(
          "title": @data["objects"][0]["title"],
          "text": @data["objects"][0]["text"]
        )
    end
  end

  private

  def data
    JSON.parse(response)
  end

  def url
    URI("https://api.diffbot.com/v3/article?token=606d0b61d6cf355ed6024deabc955e33&url=#{@summary.article_url}")
  end

  def response
    Net::HTTP.get(url)
  end
end
