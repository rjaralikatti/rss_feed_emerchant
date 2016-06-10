class RssFeedResult < ActiveRecord::Base
  
  def self.get_relevant_feeds(search_items)
    title_like_query_str = search_items.collect { |item| "title like \"%#{item}%\"" }.join(" OR ")
    description_like_query_str = search_items.collect { |item| "description like \"%#{item}%\"" }.join(" OR ")
    where("#{title_like_query_str} or #{description_like_query_str}").order("published_date desc")
  end
end
