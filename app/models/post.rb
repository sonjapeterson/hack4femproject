class Post < ActiveRecord::Base
  after_create :tweet_post

  def tweet_post
    if should_tweet && tweet_body
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = Rails.configuration.twitter_consumer_key
        config.consumer_secret     = Rails.configuration.twitter_consumer_secret
        config.access_token        = Rails.configuration.twitter_access_token
        config.access_token_secret = Rails.configuration.twitter_access_token_secret
      end
      client.update(tweet_body)
    end
  end
end
