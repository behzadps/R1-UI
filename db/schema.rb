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

ActiveRecord::Schema.define(version: 20131230151514) do

  create_table "app_campaign_lineitem_banner_performance", primary_key: "app_campaign_lineitem_banner_performance_1day_id", force: true do |t|
    t.datetime "dt"
    t.string   "source_name",              limit: 100
    t.integer  "publisher_id"
    t.integer  "app_id"
    t.integer  "region_id"
    t.integer  "advertiser_id"
    t.integer  "campaign_id"
    t.integer  "line_id"
    t.integer  "strategy_id"
    t.integer  "creative_id"
    t.string   "active_default_flag"
    t.string   "ad_type"
    t.integer  "impressions"
    t.integer  "clicks"
    t.integer  "conversions"
    t.integer  "view_through_conversions"
    t.float    "revenue"
    t.float    "pub_revenue"
    t.integer  "video_view_start",         limit: 8
    t.integer  "video_view_1",             limit: 8
    t.integer  "video_view_2",             limit: 8
    t.integer  "video_view_3",             limit: 8
    t.integer  "video_view_end",           limit: 8
    t.integer  "bids",                     limit: 8
    t.float    "bid_price"
    t.integer  "Uniques",                              null: false
  end

  create_table "geo_map_state", primary_key: "id_geo_map_state", force: true do |t|
    t.string  "Country_code", limit: 10
    t.string  "country_name", limit: 100
    t.integer "value_map"
  end

  create_table "geo_map_states", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "r1data", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "segments", force: true do |t|
    t.date    "date",                     null: false
    t.text    "attribute_name",           null: false
    t.integer "impressions",    limit: 8, null: false
    t.float   "CTR",                      null: false
    t.float   "eCPA",                     null: false
  end

end
