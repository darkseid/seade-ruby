class Yql
	
	BASE_YQL_URL = "http://query.yahooapis.com/v1/public/yql?format=xml&q=use+%27http://violenciasp.appspot.com/crimescontrapatrimonio.xml%27+as+indice_violencia;select+*+from+indice_violencia";
	
	def get_criminal_info nome
		
		url = BASE_YQL_URL + URI.escape(" where nome = #{nome} ")

		puts url

xml = AppEngine::URLFetch::HTTP.get(URI.parse(url))
		puts xml

		doc =	Hpricot(xml) 	
		
		puts doc
		
		puts doc.at("delegacy").inner_text
		puts doc.at("robbery").inner_text
puts 		doc.at("thieves").inner_text
puts 		doc.at("kidnapping").inner_text
puts 		doc.at("extortion").inner_text
puts 		doc.at("swindler").inner_text
puts 		doc.at("others").inner_text
puts 		doc.at("total").inner_text
		
		
	end
	
end
