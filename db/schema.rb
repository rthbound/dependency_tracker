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

ActiveRecord::Schema.define(version: 20130321213437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dependencies", force: :cascade do |t|
    t.string   "name"
    t.text     "license"
    t.string   "license_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
  end

  create_table "javascript_dependencies", force: :cascade do |t|
    t.string   "name"
    t.text     "license"
    t.string   "license_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
  end

  create_table "project_dependencies", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "dependency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_javascript_dependencies", force: :cascade do |t|
    t.integer  "javascript_dependency_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "gem_home"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "root_path"
  end

end
