# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160610053721) do

  create_table "rss_feed_results", force: true do |t|
    t.string   "title"
    t.string   "link"
    t.string   "category"
    t.text     "description"
    t.integer  "rss_feed_id"
    t.datetime "published_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rss_feeds", force: true do |t|
    t.string   "name",                    limit: 40
    t.string   "feed_url",                limit: 80
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "crawl"
    t.datetime "latest_pub_date_crawled"
  end

end
