require 'rails_helper'

RSpec.describe "LoadingTitles", :type => :feature do
  describe "Listing Rss Feeds" do
    it "should load titles from feed", :js => true do
      FactoryGirl.create(:rss_feed)
      visit "/rss_feeds"
      wait_for_ajax
      expect(page).to have_content("file:///home/raju/merchant/feed_reader/spec/test_feed_xmls/test_feed.xml")
      expect(page).to have_content("Feed Name")
      expect(page).to have_content("Feedjira Blog")
    end
  end
end
