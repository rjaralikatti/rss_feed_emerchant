require 'rails_helper'

RSpec.describe "rss_feeds/edit", :type => :view do
  before(:each) do
    @rss_feed = assign(:rss_feed, FactoryGirl.create(:rss_feed))
  end

  it "renders the edit rss_feed form" do
    render

    assert_select "form[action=?][method=?]", rss_feed_path(@rss_feed), "post" do
    end
  end
end
