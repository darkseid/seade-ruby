class Yql
	
#	BASE_YQL_URL = 
	#=     %20'14%C2%BA%20DP'%20
	#"http://query.yahooapis.com/v1/public/yql?format=xml&q=use+%27http://violenciasp.appspot.com/crimescontrapatrimonio.xml%27+as+indice_violencia;select+*+from+indice_violencia";
	
	
	DP ={"14" => [-23.561866,	-46.691292]} 
	
	def get_criminal_info nome
		
		url = "http://query.yahooapis.com/v1/public/yql?q=use%20'http%3A%2F%2Fviolenciasp.appspot.com%2Fcrimescontrapatrimonio.xml'%20as%20indice_violencia%3B%20select%20*%20from%20indice_violencia%20where%20nome%20%3D%20'#{nome}%C2%BA%20DP'%20"

		xml = AppEngine::URLFetch::HTTP.get(URI.parse(url))

		doc =	Hpricot(xml) 	
		
		{:delegacy_name=>doc.at('delegacy/delegacy').inner_text,
			:thieves => doc.at('thieves').inner_text,
			:robery => doc.at('robbery').inner_text,
			:kidnapping => doc.at('kidnapping').inner_text,
			:extortion => doc.at('extortion').inner_text,
			:swindler => doc.at('swindler').inner_text,
			:other => doc.at('others').inner_text,									
			:total => doc.at('total').inner_text}				
	end
	
end
