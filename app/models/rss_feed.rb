class RssFeed < ActiveRecord::Base
  validates_presence_of :name, :feed_url
  validates_uniqueness_of :name
end
