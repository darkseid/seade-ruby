require 'hpricot'
require 'appengine-rack'
require 'appengine-apis/urlfetch'

class YMap
	Geo_api_url = "http://local.yahooapis.com/MapsService/V1/geocode?appid=YD-9G7bey8_JXxQP6rxl.fBFGgCdNjoDMACQA--&city=sao+paulo"
	Map_api_url = "http://local.yahooapis.com/MapsService/V1/mapImage?appid=YD-9G7bey8_JXxQP6rxl.fBFGgCdNjoDMACQA--"
	
	def get_coords_for_address(address)
  	url =  Geo_api_url + "&street=#{URI.escape(address)}"
  	doc = Hpricot(AppEngine::URLFetch::HTTP.get(URI.parse(url)))
  	
 		lat = doc.at('latitude').inner_text
  	lng = doc.at('longitude').inner_text
		{:latitude => lat, :longitude => lng}		
	end
	
	def get_map(lat, lng)
  	url =  Map_api_url + "&zoom=3&latitude=#{lat}&longitude=#{lng}"
  	doc = Hpricot(AppEngine::URLFetch::HTTP.get(URI.parse(url))) 	
  	img_src = doc.at("result").inner_text
  	img_src
	end
	
end
