class RssFeed < ActiveRecord::Base
  validates_presence_of :name, :feed_url
  validates_uniqueness_of :name
  validates_format_of :feed_url, :with => URI::regexp(%w(http https file))

  include RssFetchParse
end
