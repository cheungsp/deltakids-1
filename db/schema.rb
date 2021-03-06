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

ActiveRecord::Schema.define(version: 20170619111351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.date "date_start"
    t.date "date_end"
    t.boolean "repeat"
    t.bigint "age_group_id"
    t.bigint "program_id"
    t.bigint "organization_id"
    t.string "unit_num"
    t.string "street_address"
    t.string "city"
    t.string "postal_code"
    t.string "contact_name"
    t.string "contact_email"
    t.string "contact_phone_num"
    t.time "time_start"
    t.time "time_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "website"
    t.string "cost"
    t.boolean "registration"
    t.text "description"
    t.string "more_info"
    t.index ["age_group_id"], name: "index_activities_on_age_group_id"
    t.index ["organization_id"], name: "index_activities_on_organization_id"
    t.index ["program_id"], name: "index_activities_on_program_id"
  end

  create_table "age_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calendars", force: :cascade do |t|
    t.text "events", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "cats", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_cats_on_category_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "date"
    t.string "unit_num"
    t.string "street_address"
    t.string "city"
    t.string "postal_code"
    t.string "contact_name"
    t.string "contact_email"
    t.string "contact_phone_num"
    t.string "time_start"
    t.string "time_end"
    t.bigint "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_approved", default: false
    t.index ["activity_id"], name: "index_events_on_activity_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "phone_num"
    t.string "website"
    t.string "unit_num"
    t.string "street_address"
    t.string "city"
    t.string "postal_code"
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "age_group"
    t.string "activity_type"
    t.string "description"
    t.string "target_clientelle"
    t.string "services"
    t.boolean "is_admin", default: false
    t.index ["email"], name: "index_organizations_on_email", unique: true
    t.index ["title"], name: "index_organizations_on_title", unique: true
  end

  create_table "orgprograms", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_orgprograms_on_organization_id"
    t.index ["program_id"], name: "index_orgprograms_on_program_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "category"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "age_group_id"
    t.index ["age_group_id"], name: "index_programs_on_age_group_id"
  end

  create_table "resource_filters", force: :cascade do |t|
    t.bigint "resource_id"
    t.bigint "age_group_id"
    t.bigint "resource_topic_id"
    t.bigint "resource_location_id"
    t.bigint "resource_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["age_group_id"], name: "index_resource_filters_on_age_group_id"
    t.index ["resource_id"], name: "index_resource_filters_on_resource_id"
    t.index ["resource_location_id"], name: "index_resource_filters_on_resource_location_id"
    t.index ["resource_topic_id"], name: "index_resource_filters_on_resource_topic_id"
    t.index ["resource_type_id"], name: "index_resource_filters_on_resource_type_id"
  end

  create_table "resource_locations", force: :cascade do |t|
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resource_topics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resource_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.boolean "feature"
    t.date "start_date"
    t.date "end_date"
    t.string "location"
    t.text "description"
    t.string "contact_name"
    t.string "contact_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "website"
    t.string "logo"
    t.bigint "category_id"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: false
    t.bigint "cat_id"
    t.index ["cat_id"], name: "index_services_on_cat_id"
    t.index ["category_id"], name: "index_services_on_category_id"
    t.index ["organization_id"], name: "index_services_on_organization_id"
  end

  add_foreign_key "activities", "age_groups"
  add_foreign_key "activities", "organizations"
  add_foreign_key "activities", "programs"
  add_foreign_key "cats", "categories"
  add_foreign_key "events", "activities"
  add_foreign_key "orgprograms", "organizations"
  add_foreign_key "orgprograms", "programs"
  add_foreign_key "programs", "age_groups"
  add_foreign_key "resource_filters", "age_groups"
  add_foreign_key "resource_filters", "resource_locations"
  add_foreign_key "resource_filters", "resource_topics"
  add_foreign_key "resource_filters", "resource_types"
  add_foreign_key "resource_filters", "resources"
  add_foreign_key "services", "categories"
  add_foreign_key "services", "cats"
  add_foreign_key "services", "organizations"
end
