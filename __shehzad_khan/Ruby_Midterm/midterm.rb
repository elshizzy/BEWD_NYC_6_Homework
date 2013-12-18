########################################################################################
#                               ----- TEDDIT! -----                                    #
#                                     Part #2                                          #
#                                                                                      #
# We're going to add a remote data source to pull in stories from Mashable and Digg.   #
#                                                                                      #
# Instructions:                                                                        #
#                                                                                      #
#    These stories will also be upvoted based on our rules. No more user input!        #
#                                                                                      #
#    Pull the json, parse it and then make a new story hash out of                     #
#    each story(Title, Category, Upvotes)                                              #
#                                                                                      #
#    Add each story to an array and display your "Front page"                          #
#                                                                                      #
#    Bring in the top news stories from the following APIs:                            #
#     - Reddit   ( http://www.reddit.com/.json )                                       #
#     - Digg     ( http://digg.com/api/news/popular.json )                             #
#     - Mashable ( http://mashable.com/stories.json )                                  #
#                                                                                      #
########################################################################################

require 'json'
require 'rest-client'

class Weather
	attr_accessor :weather
	def initialize
		@weather = []
	end

	def play
    puts "Hello there, please enter your five digit zip code"
    zipcode = gets.strip
    	until zipcode.length == 5 do
    		puts "Incorrect zip code, please re-enter your zip code"
    		zipcode = gets.strip
		end
	response = RestClient.get("i.wxbug.net/REST/Direct/GetForecast.ashx?zip=#{zipcode}&nf=1&ih=1&ht=t&ht=i&l=en&c=US&api_key=q2asxtaegetq6cj7z7sfjb2z")
	parsed_weather = JSON.parse(response)
	weather_temperature = parsed_weather["forecastList"][0]["hourly"][0]["temperature"]
	weather_description = parsed_weather["forecastList"][0]["hourly"][0]["desc"]
	puts "In zip code #{zipcode}, the weather is #{weather_description} and #{weather_temperature} degrees Fahrenheit."
	end

  	
end

