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

ActiveRecord::Schema.define(version: 2019_09_15_180812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "cama_comments", id: :serial, force: :cascade do |t|
    t.string "author"
    t.string "author_email"
    t.string "author_url"
    t.string "author_IP"
    t.text "content"
    t.string "approved", default: "pending"
    t.string "agent"
    t.string "typee"
    t.integer "comment_parent"
    t.integer "post_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["approved"], name: "index_cama_comments_on_approved"
    t.index ["comment_parent"], name: "index_cama_comments_on_comment_parent"
    t.index ["post_id"], name: "index_cama_comments_on_post_id"
    t.index ["user_id"], name: "index_cama_comments_on_user_id"
  end

  create_table "cama_custom_fields", id: :serial, force: :cascade do |t|
    t.string "object_class"
    t.string "name"
    t.string "slug"
    t.integer "objectid"
    t.integer "parent_id"
    t.integer "field_order"
    t.integer "count", default: 0
    t.boolean "is_repeat", default: false
    t.text "description"
    t.string "status"
    t.index ["object_class"], name: "index_cama_custom_fields_on_object_class"
    t.index ["objectid"], name: "index_cama_custom_fields_on_objectid"
    t.index ["parent_id"], name: "index_cama_custom_fields_on_parent_id"
    t.index ["slug"], name: "index_cama_custom_fields_on_slug"
  end

  create_table "cama_custom_fields_relationships", id: :serial, force: :cascade do |t|
    t.integer "objectid"
    t.integer "custom_field_id"
    t.integer "term_order"
    t.string "object_class"
    t.text "value"
    t.string "custom_field_slug"
    t.integer "group_number", default: 0
    t.index ["custom_field_id"], name: "index_cama_custom_fields_relationships_on_custom_field_id"
    t.index ["custom_field_slug"], name: "index_cama_custom_fields_relationships_on_custom_field_slug"
    t.index ["object_class"], name: "index_cama_custom_fields_relationships_on_object_class"
    t.index ["objectid"], name: "index_cama_custom_fields_relationships_on_objectid"
  end

  create_table "cama_media", id: :serial, force: :cascade do |t|
    t.integer "site_id"
    t.string "name"
    t.boolean "is_folder", default: false
    t.string "folder_path"
    t.string "file_size"
    t.string "dimension", default: ""
    t.string "file_type"
    t.string "url"
    t.string "thumb"
    t.boolean "is_public", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["folder_path"], name: "index_cama_media_on_folder_path"
    t.index ["is_folder"], name: "index_cama_media_on_is_folder"
    t.index ["name"], name: "index_cama_media_on_name"
    t.index ["site_id"], name: "index_cama_media_on_site_id"
  end

  create_table "cama_metas", id: :serial, force: :cascade do |t|
    t.string "key"
    t.text "value"
    t.integer "objectid"
    t.string "object_class"
    t.index ["key"], name: "index_cama_metas_on_key"
    t.index ["object_class"], name: "index_cama_metas_on_object_class"
    t.index ["objectid"], name: "index_cama_metas_on_objectid"
  end

  create_table "cama_posts", id: :serial, force: :cascade do |t|
    t.text "title"
    t.text "slug"
    t.text "content"
    t.text "content_filtered"
    t.string "status", default: "published"
    t.datetime "published_at"
    t.integer "post_parent"
    t.string "visibility", default: "public"
    t.text "visibility_value"
    t.string "post_class", default: "Post"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "post_order", default: 0
    t.integer "taxonomy_id"
    t.boolean "is_feature", default: false
    t.index ["post_class"], name: "index_cama_posts_on_post_class"
    t.index ["post_parent"], name: "index_cama_posts_on_post_parent"
    t.index ["slug"], name: "index_cama_posts_on_slug"
    t.index ["status"], name: "index_cama_posts_on_status"
    t.index ["user_id"], name: "index_cama_posts_on_user_id"
  end

  create_table "cama_term_relationships", id: :serial, force: :cascade do |t|
    t.integer "objectid"
    t.integer "term_order"
    t.integer "term_taxonomy_id"
    t.index ["objectid"], name: "index_cama_term_relationships_on_objectid"
    t.index ["term_order"], name: "index_cama_term_relationships_on_term_order"
    t.index ["term_taxonomy_id"], name: "index_cama_term_relationships_on_term_taxonomy_id"
  end

  create_table "cama_term_taxonomy", id: :serial, force: :cascade do |t|
    t.string "taxonomy"
    t.text "description"
    t.integer "parent_id"
    t.integer "count"
    t.text "name"
    t.string "slug"
    t.integer "term_group"
    t.integer "term_order"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["parent_id"], name: "index_cama_term_taxonomy_on_parent_id"
    t.index ["slug"], name: "index_cama_term_taxonomy_on_slug"
    t.index ["taxonomy"], name: "index_cama_term_taxonomy_on_taxonomy"
    t.index ["term_order"], name: "index_cama_term_taxonomy_on_term_order"
    t.index ["user_id"], name: "index_cama_term_taxonomy_on_user_id"
  end

  create_table "cama_users", id: :serial, force: :cascade do |t|
    t.string "username"
    t.string "role", default: "client"
    t.string "email"
    t.string "slug"
    t.string "password_digest"
    t.string "auth_token"
    t.string "password_reset_token"
    t.integer "parent_id"
    t.datetime "password_reset_sent_at"
    t.datetime "last_login_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "site_id", default: -1
    t.string "confirm_email_token"
    t.datetime "confirm_email_sent_at"
    t.boolean "is_valid_email", default: true
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_cama_users_on_email"
    t.index ["role"], name: "index_cama_users_on_role"
    t.index ["site_id"], name: "index_cama_users_on_site_id"
    t.index ["username"], name: "index_cama_users_on_username"
  end

  create_table "plugins_attacks", force: :cascade do |t|
    t.string "path"
    t.string "browser_key"
    t.bigint "site_id"
    t.datetime "created_at"
    t.index ["browser_key"], name: "index_plugins_attacks_on_browser_key"
    t.index ["path"], name: "index_plugins_attacks_on_path"
    t.index ["site_id"], name: "index_plugins_attacks_on_site_id"
  end

  create_table "plugins_contact_forms", id: :serial, force: :cascade do |t|
    t.integer "site_id"
    t.integer "count"
    t.integer "parent_id"
    t.string "name"
    t.string "slug"
    t.text "description"
    t.text "value"
    t.text "settings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plugins_ecommerce_attributes", id: :serial, force: :cascade do |t|
    t.string "key"
    t.string "label"
    t.integer "parent_id"
    t.integer "site_id"
    t.integer "position", default: 0
    t.index ["parent_id"], name: "index_plugins_ecommerce_attributes_on_parent_id"
    t.index ["site_id"], name: "index_plugins_ecommerce_attributes_on_site_id"
  end

  create_table "plugins_ecommerce_orders", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "kind"
    t.string "coupon"
    t.string "the_coupon_amount"
    t.string "currency_code"
    t.string "payment_data"
    t.string "status", default: "unpaid"
    t.integer "shipping_method_id"
    t.integer "user_id"
    t.integer "site_id"
    t.integer "payment_method_id"
    t.datetime "paid_at"
    t.datetime "received_at"
    t.datetime "accepted_at"
    t.datetime "shipped_at"
    t.datetime "closed_at"
    t.string "cache_the_total"
    t.string "cache_the_sub_total"
    t.string "cache_the_tax"
    t.string "cache_the_weight"
    t.string "cache_the_discounts"
    t.string "cache_the_shipping"
    t.decimal "amount", precision: 8, scale: 2
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "visitor_key"
    t.string "invoice_number", default: ""
    t.string "invoice_path", default: ""
    t.index ["payment_method_id"], name: "index_plugins_ecommerce_orders_on_payment_method_id"
    t.index ["shipping_method_id"], name: "index_plugins_ecommerce_orders_on_shipping_method_id"
    t.index ["site_id"], name: "index_plugins_ecommerce_orders_on_site_id"
    t.index ["user_id"], name: "index_plugins_ecommerce_orders_on_user_id"
  end

  create_table "plugins_ecommerce_product_variations", id: :serial, force: :cascade do |t|
    t.decimal "amount", precision: 8, scale: 2
    t.integer "product_id"
    t.string "photo"
    t.string "sku"
    t.integer "weight"
    t.integer "position", default: 0
    t.integer "qty", default: 0
    t.string "attribute_ids"
    t.index ["product_id"], name: "index_plugins_ecommerce_product_variations_on_product_id"
  end

  create_table "plugins_ecommerce_products", id: :serial, force: :cascade do |t|
    t.integer "qty"
    t.integer "product_id"
    t.integer "order_id"
    t.string "cache_the_price"
    t.string "cache_the_title"
    t.string "cache_the_tax"
    t.string "cache_the_sub_total"
    t.integer "variation_id"
    t.index ["order_id"], name: "index_plugins_ecommerce_products_on_order_id"
    t.index ["product_id"], name: "index_plugins_ecommerce_products_on_product_id"
    t.index ["qty"], name: "index_plugins_ecommerce_products_on_qty"
  end

  create_table "plugins_order_details", id: :serial, force: :cascade do |t|
    t.integer "order_id"
    t.string "customer"
    t.string "email"
    t.string "phone"
    t.datetime "received_at"
    t.datetime "accepted_at"
    t.datetime "shipped_at"
    t.datetime "closed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
