require "httparty"

class Tweet < ActiveRecord::Base
  class << self
    def update_tweets
      tweets = HTTParty.get("http://search.twitter.com/search.json?q=%23owesme")
      tweets["results"].each do |tweet|
        unless find_by_tweet_id(tweet["id"].to_i)
          create!(:tweet_id => tweet["id"], :message => tweet["text"], :sender_id => tweet["from_user_id"], :sender => tweet["from_user"], :profile_image_url => tweet["profile_image_url"], :sent_at => tweet["created_at"])
        end
      end
    end
  end
end
