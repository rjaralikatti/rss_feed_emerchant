require 'rails_helper'

RSpec.describe "RssFeeds", :type => :request do
  describe "GET /rss_feeds" do
    it "works! (now write some real specs)" do
      get rss_feeds_path
      expect(response.status).to be(200)
    end
  end
end
