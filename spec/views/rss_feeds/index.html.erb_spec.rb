require 'rails_helper'

RSpec.describe "rss_feeds/index", :type => :view do
  before(:each) do
    assign(:rss_feeds, [
        FactoryGirl.create(:rss_feed),
        FactoryGirl.create(:rss_feed)
    ])
  end

  it "renders a list of rss_feeds" do
    render
  end
end
