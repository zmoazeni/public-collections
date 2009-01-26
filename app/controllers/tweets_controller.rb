class TweetsController < ApplicationController
  def index
    @tweets = Tweet.find(:all, :limit => 15, :order => "sent_at desc")
  end
  
  def all
    @tweets = Tweet.find(:all, :order => "sent_at desc")
  end
  
  def updated
    @queued_tweets = Tweet.find(:all, :conditions => ["tweet_id > ?", params[:since]], :order => "sent_at desc")
    render :layout => false
  end
end
