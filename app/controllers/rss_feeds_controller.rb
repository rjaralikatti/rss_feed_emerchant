class RssFeedsController < ApplicationController
  before_action :set_rss_feed, only: [:show, :edit, :update, :destroy]

  def index
    @rss_feeds = RssFeed.all
  end

  def show
  end

  def new
    @rss_feed = RssFeed.new
  end

  def edit
  end

  def create
    @rss_feed = RssFeed.new(rss_feed_params)

    if @rss_feed.save
      redirect_to @rss_feed, notice: 'Rss feed was successfully created.'
    else
      render :new
    end
  end

  def update
    if @rss_feed.update(rss_feed_params)
      redirect_to @rss_feed, notice: 'Rss feed was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @rss_feed.destroy
    redirect_to rss_feeds_url, notice: 'Rss feed was successfully destroyed.'
  end

  def all_latest_feeds
    feed_urls = @rss_feeds.collect { |rss_feed| rss_feed.feed_url }
    all_feeds = Feedjira::Feed.fetch_and_parse feed_urls
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_rss_feed
    @rss_feed = RssFeed.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rss_feed_params
    params.require(:rss_feed).permit(:name, :feed_url, :description)
  end
end
