require 'rubygems'
require 'sinatra'
require 'erb'
require 'ymap'
require 'yql'


  get '/' do
    erb :home
  end

  get '/search' do
		ymap = YMap.new
		coords = ymap.get_coords_for_address params[:address]

    content_type 'application/xml', :charset => 'utf-8'
    xml = <<EOF
<result><Address><address_latitude>#{coords[:latitude]}</address_latitude><address_longitude>#{coords[:longitude]}</address_longitude></Address><delegacy><delegacy_name>14º DP</delegacy_name><delegacy_latitude>-23.561866</delegacy_latitude><delegacy_longitude>-46.691292</delegacy_longitude><crimes><thieves>6.274</thieves><robbery>2.875</robbery><kidnapping>-</kidnapping><extortion>2</extortion><swindler>748</swindler><others>395</others><total>10.294</total></crimes></delegacy><percentages><p_thieves>3.0%</p_thieves><p_robbery>1.0%</p_robbery><p_kiddnapping>-</p_kiddnapping><p_extortion>0.0%</p_extortion><p_swindler>4.0%</p_swindler><p_others>2.0%</p_others><p_total>2.0%</p_total></percentages></result>
EOF
    xml
  end
  
  get '/map' do
  	
		ymap = YMap.new
		coords = ymap.get_coords_for_address params[:address]

		img = ymap.get_map(coords[:latitude], coords[:longitude])  	
  	"<img src='#{img}'/>"
 	end
  
  get '/ymap' do
  	erb :teste
 	end	
  
	get '/info' do
		
		Yql.new.get_criminal_info "26º"
		
		"Okie"
	end  
  
  
  
  
