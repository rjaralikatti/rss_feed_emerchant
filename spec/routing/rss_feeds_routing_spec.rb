require "rails_helper"

RSpec.describe RssFeedsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rss_feeds").to route_to("rss_feeds#index")
    end

    it "routes to #new" do
      expect(:get => "/rss_feeds/new").to route_to("rss_feeds#new")
    end

    it "routes to #show" do
      expect(:get => "/rss_feeds/1").to route_to("rss_feeds#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rss_feeds/1/edit").to route_to("rss_feeds#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rss_feeds").to route_to("rss_feeds#create")
    end

    it "routes to #update" do
      expect(:put => "/rss_feeds/1").to route_to("rss_feeds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rss_feeds/1").to route_to("rss_feeds#destroy", :id => "1")
    end

  end
end
