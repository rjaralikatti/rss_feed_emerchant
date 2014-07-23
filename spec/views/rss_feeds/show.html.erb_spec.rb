require 'rails_helper'

RSpec.describe "rss_feeds/show", :type => :view do
  before(:each) do
    @rss_feed = assign(:rss_feed, FactoryGirl.create(:rss_feed))
  end

  it "renders attributes in <p>" do
    render
  end
end
