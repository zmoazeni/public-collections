class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.integer :tweet_id
      t.string  :message
      t.string  :sender_id
      t.string  :sender
      t.string  :profile_image_url
      t.datetime :sent_at
      
      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
