class AddColumnCrawlRssFeeds < ActiveRecord::Migration
  def change
    add_column :rss_feeds, :crawl, :boolean
    add_column :rss_feeds, :latest_pub_date_crawled, :timestamp
  end
end
