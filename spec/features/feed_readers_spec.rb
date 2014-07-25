require 'rails_helper'

RSpec.describe "FeedReaders", :type => :feature do
  describe "GET /feed_readers" do
    it "should load titles from feed", :js => true do
      FactoryGirl.create(:rss_feed)
      visit "/rss_feeds/reader"
      wait_for_ajax
      expect(page).to have_content("Thoughts on Version Two-Point-Oh")
      expect(page).to have_content("A Separate Project For Benchmarks")
      expect(page).to have_content("Feedjira Goes One-Point-Oh")
    end
  end
end
