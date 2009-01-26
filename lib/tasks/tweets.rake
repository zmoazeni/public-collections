namespace :twitter do
  desc "grab recent tweets"
  task :update => :environment do
    Tweet.update_tweets
  end
end