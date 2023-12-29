class WeatherService
  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org') do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.weather_api[:key]
    end
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_weather(lat,lon)
    get_url("/data/3.0/onecall?lat=#{lat}&lon=#{lon}&appid=0271d0042939f06c9b1b8a5edc9642ff&exclude=minutely,hourly,alerts&units=imperial")
  end
end