class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body, null: false
      t.string :title, null: false
      t.text :tweet_body
      t.string :tweet_url
      t.boolean :should_tweet, null: false, default: false
      t.timestamps null: false
    end
  end
end
