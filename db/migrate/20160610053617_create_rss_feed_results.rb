class CreateRssFeedResults < ActiveRecord::Migration
  def change
    create_table :rss_feed_results do |t|
      t.string :title, :link, :category
      t.text :description
      t.integer :rss_feed_id
      t.timestamp :published_date
      t.timestamps
    end
  end
end
