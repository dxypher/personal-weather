class PagesController < ApplicationController
	def home
		@weather_lookup = WeatherLookup.new		
	end
end
