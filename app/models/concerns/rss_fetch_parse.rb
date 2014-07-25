module RssFetchParse
  extend ActiveSupport::Concern

  module ClassMethods
    def fetch_and_parse_feeds all_feeds
      urls = all_feeds.collect { |rss_feed| rss_feed.feed_url }.compact
      Feedjira::Feed.fetch_and_parse(urls)
    end

    def get_latest_feeds
      all_feeds = all
      entries = []
      parsed_feeds = fetch_and_parse_feeds(all_feeds)
      all_feeds.each do |feed|
        parsed_feeds[feed.feed_url].try(:entries).try(:each) do |entry|
          entries << entry
        end
      end
      entries.uniq.sort_by { |entry| entry.published }.reverse.first(30)
    end
  end
end
