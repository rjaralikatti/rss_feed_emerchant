require 'rails_helper'

RSpec.describe RssFeedsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # RssFeed. As you add validations to RssFeed, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { :name => "Raju", :feed_url => "file:///home/raju/merchant/feed_reader/spec/test_feed_xmls/test_feed.xml", :description => "Some Description" }
  }

  let(:invalid_attributes) {
    { :name => "Raju" }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RssFeedsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all rss_feeds as @rss_feeds" do
      rss_feed = RssFeed.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:rss_feeds)).to eq([rss_feed])
    end
  end

  describe "GET show" do
    it "assigns the requested rss_feed as @rss_feed" do
      rss_feed = RssFeed.create! valid_attributes
      get :show, {:id => rss_feed.to_param}, valid_session
      expect(assigns(:rss_feed)).to eq(rss_feed)
    end
  end

  describe "GET new" do
    it "assigns a new rss_feed as @rss_feed" do
      get :new, {}, valid_session
      expect(assigns(:rss_feed)).to be_a_new(RssFeed)
    end
  end

  describe "GET edit" do
    it "assigns the requested rss_feed as @rss_feed" do
      rss_feed = RssFeed.create! valid_attributes
      get :edit, {:id => rss_feed.to_param}, valid_session
      expect(assigns(:rss_feed)).to eq(rss_feed)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new RssFeed" do
        expect {
          post :create, {:rss_feed => valid_attributes}, valid_session
        }.to change(RssFeed, :count).by(1)
      end

      it "assigns a newly created rss_feed as @rss_feed" do
        post :create, {:rss_feed => valid_attributes}, valid_session
        expect(assigns(:rss_feed)).to be_a(RssFeed)
        expect(assigns(:rss_feed)).to be_persisted
      end

      it "redirects to the created rss_feed" do
        post :create, {:rss_feed => valid_attributes}, valid_session
        expect(response).to redirect_to(RssFeed.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved rss_feed as @rss_feed" do
        post :create, {:rss_feed => invalid_attributes}, valid_session
        expect(assigns(:rss_feed)).to be_a_new(RssFeed)
      end

      it "re-renders the 'new' template" do
        post :create, {:rss_feed => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        { :name => "Raju Updated", :feed_url => "file:///home/raju/merchant/feed_reader/spec/test_feed_xmls/test_feed1.xml", :description => "Some Description Updated" }
      }

      it "updates the requested rss_feed" do
        rss_feed = RssFeed.create! valid_attributes
        put :update, {:id => rss_feed.to_param, :rss_feed => new_attributes}, valid_session
        rss_feed.reload
        expect(assigns(:rss_feed).name).to eq("Raju Updated")
      end

      it "assigns the requested rss_feed as @rss_feed" do
        rss_feed = RssFeed.create! valid_attributes
        put :update, {:id => rss_feed.to_param, :rss_feed => valid_attributes}, valid_session
        expect(assigns(:rss_feed)).to eq(rss_feed)
      end

      it "redirects to the rss_feed" do
        rss_feed = RssFeed.create! valid_attributes
        put :update, {:id => rss_feed.to_param, :rss_feed => valid_attributes}, valid_session
        expect(response).to redirect_to(rss_feed)
      end
    end

    describe "with invalid params" do
      it "assigns the rss_feed as @rss_feed" do
        rss_feed = RssFeed.create! valid_attributes
        put :update, {:id => rss_feed.to_param, :rss_feed => invalid_attributes}, valid_session
        expect(assigns(:rss_feed)).to eq(rss_feed)
      end

      it "re-renders the 'edit' template" do
        rss_feed = RssFeed.create! valid_attributes
        put :update, {:id => rss_feed.to_param, :rss_feed => {:name => ""}}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested rss_feed" do
      rss_feed = RssFeed.create! valid_attributes
      expect {
        delete :destroy, {:id => rss_feed.to_param}, valid_session
      }.to change(RssFeed, :count).by(-1)
    end

    it "redirects to the rss_feeds list" do
      rss_feed = RssFeed.create! valid_attributes
      delete :destroy, {:id => rss_feed.to_param}, valid_session
      expect(response).to redirect_to(rss_feeds_url)
    end
  end

end
