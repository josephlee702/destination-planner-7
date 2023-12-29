class GifFacade
  def self.gifs(weather)
    json_response = GifService.gifs(weather)
    json_response[:data].first[:images][:original][:url]
  end
end