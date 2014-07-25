require 'rails_helper'

RSpec.describe RssFeed, :type => :model do
  it "should validate presence of name and feed_url" do
    rss_feed = FactoryGirl.build(:rss_feed, :name => "", :feed_url => "")
    expect(rss_feed.save).to be(false)
    expect(rss_feed.errors.messages[:name].count).to be(1)
    expect(rss_feed.errors.messages[:feed_url].count).to be(2)
    expect(rss_feed.errors.count).to be(3)
  end

  it "should validate uniqueness of name" do
    FactoryGirl.create(:rss_feed, :name => "Boom Boom")
    rss_feed = FactoryGirl.build(:rss_feed, :name => "Boom Boom")
    expect(rss_feed.save).to be(false)
    expect(rss_feed.errors.count).to be(1)
  end

  it "should fetch and parse rss feed" do
    FactoryGirl.create(:rss_feed)
    all_feeds = RssFeed.all
    parsed_feeds = RssFeed.fetch_and_parse_feeds all_feeds
    expect(parsed_feeds.class).to be(Hash)
  end

  it "should fetch max latest 30 feeds" do
    FactoryGirl.create(:rss_feed)
    FactoryGirl.create(:rss_feed, :feed_url => "file:///home/raju/merchant/feed_reader/spec/test_feed_xmls/test_feed2.xml")
    entries = RssFeed.get_latest_feeds
    expect(entries.class).to be(Array)
    expect(entries.size).to be <= 30
    expect(entries.size).to eq(6)
  end
end
