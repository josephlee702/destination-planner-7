class WeatherFacade
  def self.get_weather(lat,lon)
    json_response = WeatherService.get_weather(lat,lon)
  end

  def self.max_temp(lat,lon)
    x = WeatherService.get_weather(lat,lon)
    array = []
    
    x[:daily].each do |hour|
      array << hour[:temp][:max]
    end
    array.max
  end

  def self.min_temp(lat,lon)
    x = WeatherService.get_weather(lat,lon)
    array = []

    x[:daily].each do |hour|
      array << hour[:temp][:min]
    end
    array.min
  end
end