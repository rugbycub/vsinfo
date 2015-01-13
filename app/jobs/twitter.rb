require 'twitter'


#### Get your twitter keys & secrets:
#### https://dev.twitter.com/docs/auth/tokens-devtwittercom
twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = 'A8kjDin3cbU99iSA7W0YfUz7T'
  config.consumer_secret = 'WSwHA1y3fp85qR7MWmjBu9I12vMQF8h0XNwBlAamU567XLjP6O'
  config.access_token = '2246104818-DzdfcowRuHJLRxC8gnLYECxbR8zQJMcwQQ8jBFA'
  config.access_token_secret = 's5M2RvvMDzcXlcllMXcJVQiy4tcOIMce9WIilKhcXlaAm'
end

search_term = URI::encode('virginatlantic')

Dashing.scheduler.every '10m', first_in: 1.second.since, allow_overlapping: false do |job|
  begin
    tweets = twitter.user_timeline('virginatlantic')#, :exclude_replies => true)

    if tweets
      tweets = tweets.map do |tweet|
        { name: tweet.user.name, body: tweet.text, avatar: tweet.user.profile_image_url_https }
      end
      Dashing.send_event('twitter_mentions', comments: tweets)
    end
  rescue Twitter::Error
    puts "\e[33mFor the twitter widget to work, you need to put in your twitter API keys in the jobs/twitter.rb file.\e[0m"
  end
end