class WeatherLookup
	attr_accessor :temperature, :icon
	
	def initialize
		weather_hash = fetch_weather
		assign_values(weather_hash)
	end

	def fetch_weather
		HTTParty.get("http://api.wunderground.com/api/a8627b9a9e5f674c/hourly/q/60610.xml")
	end

	def assign_values(weather_hash)
		hourly_forecast_response = weather_hash.parsed_response['response']['hourly_forecast']['forecast'].first
		self.temperature = hourly_forecast_response['temp']['english']
		self.icon = hourly_forecast_response['icon_url']
	end


end