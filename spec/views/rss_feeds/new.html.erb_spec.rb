require 'rails_helper'

RSpec.describe "rss_feeds/new", :type => :view do
  before(:each) do
    assign(:rss_feed, RssFeed.new())
  end

  it "renders new rss_feed form" do
    render

    assert_select "form[action=?][method=?]", rss_feeds_path, "post" do
    end
  end
end
