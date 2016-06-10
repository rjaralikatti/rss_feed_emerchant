namespace :crawl_feeds do
  desc "Crawls data from RSS feeds"
  task crawl: :environment do
    RssFeed.where(crawl: true).each do |feed|
      entries = []
      parsed_feeds = RssFeed.fetch_and_parse_feeds([feed])
      parsed_feeds[feed.feed_url].try(:entries).try(:each) do |entry|
        entries << entry
      end
      entries.uniq.sort_by { |entry| entry.published }.each do |p_feed|
        if feed.latest_pub_date_crawled.blank? || feed.latest_pub_date_crawled < p_feed.published
          rss_feed_result = RssFeedResult.new
          rss_feed_result.title = p_feed.title
          rss_feed_result.link = p_feed.url
          rss_feed_result.description = p_feed.summary
          rss_feed_result.published_date = p_feed.published
          rss_feed_result.rss_feed_id = feed.id
          rss_feed_result.save
          feed.latest_pub_date_crawled = p_feed.published
          feed.save
        end
      end
      
    end
  end

end
