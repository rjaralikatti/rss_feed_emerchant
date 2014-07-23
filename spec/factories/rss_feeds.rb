# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rss_feed do
    sequence(:name) { |n| "Feed Name - #{n}" }
    feed_url "file:///home/raju/merchant/feed_reader/spec/test_feed_xmls/test_feed.xml"
  end
end
