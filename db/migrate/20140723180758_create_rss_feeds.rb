class CreateRssFeeds < ActiveRecord::Migration
  def change
    create_table :rss_feeds do |t|
      t.string :name, :limit => 40
      t.string :feed_url, :limit => 80
      t.text :description

      t.timestamps
    end
  end
end
