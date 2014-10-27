class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :twitter_id
      t.string :screen_name
      t.string :tweets_id
      t.string :img_url
      t.text :text

      t.timestamps
    end
  end
end
