class GifService
  def self.conn
    Faraday.new(url: 'https://api.giphy.com') do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.weather_api[:key]
    end
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.gifs(weather)
    get_url("/v1/gifs/search?api_key=fEIDj8dv7YEsiXJXz6KDU3mq9XGFGi3F&q=#{weather}&limit=25&rating=g&lang=en&bundle=messaging_non_clips")
  end
end