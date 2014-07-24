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
end
