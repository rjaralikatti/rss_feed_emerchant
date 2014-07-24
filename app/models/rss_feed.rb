class RssFeed < ActiveRecord::Base
  validates_presence_of :name, :feed_url
  validates_uniqueness_of :name
  validates_format_of :feed_url, :with => URI::regexp(%w(http https file))

  def self.fetch_and_parse_feeds all_feeds
    urls = all_feeds.collect { |rss_feed| rss_feed.feed_url }.compact
    Feedjira::Feed.fetch_and_parse(urls)
  end

  def self.get_latest_feeds
    all_feeds = all
    entries = []
    parsed_feeds = fetch_and_parse_feeds(all_feeds)
    all_feeds.each do |feed|
      parsed_feeds[feed.feed_url].entries.each do |entry|
        entries << entry
      end
    end
    entries.sort_by { |entry| entry.published }.reverse
  end
end
