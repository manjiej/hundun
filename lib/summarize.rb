class Scrape

  def self.scrape(url)
    response = Net::HTTP.get(URI("https://api.diffbot.com/v3/article?token=606d0b61d6cf355ed6024deabc955e33&url=#{URI.encode(url)}"))
    parsed_res = JSON.parse(response)
    parsed_res["objects"][0]
  end

  def self.digest
  end

end
