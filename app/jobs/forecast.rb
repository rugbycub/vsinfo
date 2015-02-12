require 'net/http'
require 'uri'
require 'json'
Dashing.scheduler.every '5m', first_in: 1.second.since, allow_overlapping: false do |job|
  world_weather_online_api_key = '47aa8276c4916918828a0516f7f8c' # your api key here
  zip_code = "90045"                # your zip code here
  uri = URI.parse(
    'http://api.worldweatheronline.com/free/v2/weather.ashx' +
    "?key=#{world_weather_online_api_key}&q=#{zip_code}" +
    '&format=json'
  )
  response    = Net::HTTP.get(uri)
  forecast    = JSON.parse(response)['data']['current_condition'][0]
  description = forecast['weatherDesc'][0]['value']
  farenheit   = forecast['temp_F']
  code        = forecast['weatherCode']
  Dashing.send_event('forecast_lax', {
    farenheit: "#{farenheit}&deg;F",
    summary:   "#{description}",
    code:      "#{code}"
  })
end