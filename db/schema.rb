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

ActiveRecord::Schema.define(version: 20171002102262) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "picture"
    t.string   "website_link"
    t.integer  "conference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ahoy_events", force: :cascade do |t|
    t.integer  "visit_id"
    t.integer  "user_id"
    t.string   "name"
    t.text     "properties"
    t.datetime "time"
  end

  add_index "ahoy_events", ["time"], name: "index_ahoy_events_on_time", using: :btree
  add_index "ahoy_events", ["user_id"], name: "index_ahoy_events_on_user_id", using: :btree
  add_index "ahoy_events", ["visit_id"], name: "index_ahoy_events_on_visit_id", using: :btree

  create_table "alchemy_attachments", force: :cascade do |t|
    t.string   "name"
    t.string   "file_name"
    t.string   "file_mime_type"
    t.integer  "file_size"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "cached_tag_list"
    t.string   "file_uid"
  end

  add_index "alchemy_attachments", ["file_uid"], name: "index_alchemy_attachments_on_file_uid", using: :btree

  create_table "alchemy_cells", force: :cascade do |t|
    t.integer  "page_id",    null: false
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "alchemy_cells", ["page_id"], name: "index_alchemy_cells_on_page_id", using: :btree

  create_table "alchemy_contents", force: :cascade do |t|
    t.string   "name"
    t.string   "essence_type", null: false
    t.integer  "essence_id",   null: false
    t.integer  "element_id",   null: false
    t.integer  "position"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  add_index "alchemy_contents", ["element_id", "position"], name: "index_contents_on_element_id_and_position", using: :btree
  add_index "alchemy_contents", ["essence_id", "essence_type"], name: "index_alchemy_contents_on_essence_id_and_essence_type", unique: true, using: :btree

  create_table "alchemy_elements", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.integer  "page_id",                           null: false
    t.boolean  "public",            default: true
    t.boolean  "folded",            default: false
    t.boolean  "unique",            default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "cell_id"
    t.text     "cached_tag_list"
    t.integer  "parent_element_id"
  end

  add_index "alchemy_elements", ["cell_id"], name: "index_alchemy_elements_on_cell_id", using: :btree
  add_index "alchemy_elements", ["page_id", "parent_element_id"], name: "index_alchemy_elements_on_page_id_and_parent_element_id", using: :btree
  add_index "alchemy_elements", ["page_id", "position"], name: "index_elements_on_page_id_and_position", using: :btree

  create_table "alchemy_elements_alchemy_pages", id: false, force: :cascade do |t|
    t.integer "element_id"
    t.integer "page_id"
  end

  create_table "alchemy_essence_booleans", force: :cascade do |t|
    t.boolean  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  add_index "alchemy_essence_booleans", ["value"], name: "index_alchemy_essence_booleans_on_value", using: :btree

  create_table "alchemy_essence_dates", force: :cascade do |t|
    t.datetime "date"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alchemy_essence_files", force: :cascade do |t|
    t.integer  "attachment_id"
    t.string   "title"
    t.string   "css_class"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "link_text"
  end

  add_index "alchemy_essence_files", ["attachment_id"], name: "index_alchemy_essence_files_on_attachment_id", using: :btree

  create_table "alchemy_essence_htmls", force: :cascade do |t|
    t.text     "source"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alchemy_essence_links", force: :cascade do |t|
    t.string   "link"
    t.string   "link_title"
    t.string   "link_target"
    t.string   "link_class_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  create_table "alchemy_essence_pictures", force: :cascade do |t|
    t.integer  "picture_id"
    t.string   "caption"
    t.string   "title"
    t.string   "alt_tag"
    t.string   "link"
    t.string   "link_class_name"
    t.string   "link_title"
    t.string   "css_class"
    t.string   "link_target"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "crop_from"
    t.string   "crop_size"
    t.string   "render_size"
  end

  add_index "alchemy_essence_pictures", ["picture_id"], name: "index_alchemy_essence_pictures_on_picture_id", using: :btree

  create_table "alchemy_essence_richtexts", force: :cascade do |t|
    t.text     "body"
    t.text     "stripped_body"
    t.boolean  "public"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "alchemy_essence_selects", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "creator_id"
    t.integer  "updater_id"
  end

  add_index "alchemy_essence_selects", ["value"], name: "index_alchemy_essence_selects_on_value", using: :btree

  create_table "alchemy_essence_texts", force: :cascade do |t|
    t.text     "body"
    t.string   "link"
    t.string   "link_title"
    t.string   "link_class_name"
    t.boolean  "public",          default: false
    t.string   "link_target"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "alchemy_folded_pages", force: :cascade do |t|
    t.integer "page_id",                 null: false
    t.integer "user_id",                 null: false
    t.boolean "folded",  default: false
  end

  add_index "alchemy_folded_pages", ["page_id", "user_id"], name: "index_alchemy_folded_pages_on_page_id_and_user_id", unique: true, using: :btree

  create_table "alchemy_languages", force: :cascade do |t|
    t.string   "name"
    t.string   "language_code"
    t.string   "frontpage_name"
    t.string   "page_layout",    default: "intro"
    t.boolean  "public",         default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.boolean  "default",        default: false
    t.string   "country_code",   default: "",      null: false
    t.integer  "site_id",                          null: false
    t.string   "locale"
  end

  add_index "alchemy_languages", ["language_code", "country_code"], name: "index_alchemy_languages_on_language_code_and_country_code", using: :btree
  add_index "alchemy_languages", ["language_code"], name: "index_alchemy_languages_on_language_code", using: :btree
  add_index "alchemy_languages", ["site_id"], name: "index_alchemy_languages_on_site_id", using: :btree

  create_table "alchemy_legacy_page_urls", force: :cascade do |t|
    t.string   "urlname",    null: false
    t.integer  "page_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "alchemy_legacy_page_urls", ["page_id"], name: "index_alchemy_legacy_page_urls_on_page_id", using: :btree
  add_index "alchemy_legacy_page_urls", ["urlname"], name: "index_alchemy_legacy_page_urls_on_urlname", using: :btree

  create_table "alchemy_pages", force: :cascade do |t|
    t.string   "name"
    t.string   "urlname"
    t.string   "title"
    t.string   "language_code"
    t.boolean  "language_root"
    t.string   "page_layout"
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "parent_id"
    t.integer  "depth"
    t.boolean  "visible",          default: false
    t.integer  "locked_by"
    t.boolean  "restricted",       default: false
    t.boolean  "robot_index",      default: true
    t.boolean  "robot_follow",     default: true
    t.boolean  "sitemap",          default: true
    t.boolean  "layoutpage",       default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.integer  "language_id"
    t.text     "cached_tag_list"
    t.datetime "published_at"
    t.datetime "public_on"
    t.datetime "public_until"
    t.datetime "locked_at"
  end

  add_index "alchemy_pages", ["language_id"], name: "index_pages_on_language_id", using: :btree
  add_index "alchemy_pages", ["locked_at", "locked_by"], name: "index_alchemy_pages_on_locked_at_and_locked_by", using: :btree
  add_index "alchemy_pages", ["parent_id", "lft"], name: "index_pages_on_parent_id_and_lft", using: :btree
  add_index "alchemy_pages", ["public_on", "public_until"], name: "index_alchemy_pages_on_public_on_and_public_until", using: :btree
  add_index "alchemy_pages", ["rgt"], name: "index_alchemy_pages_on_rgt", using: :btree
  add_index "alchemy_pages", ["urlname"], name: "index_pages_on_urlname", using: :btree

  create_table "alchemy_pictures", force: :cascade do |t|
    t.string   "name"
    t.string   "image_file_name"
    t.integer  "image_file_width"
    t.integer  "image_file_height"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.string   "upload_hash"
    t.text     "cached_tag_list"
    t.string   "image_file_uid"
    t.integer  "image_file_size"
    t.string   "image_file_format"
  end

  create_table "alchemy_sites", force: :cascade do |t|
    t.string   "host"
    t.string   "name"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "public",                   default: false
    t.text     "aliases"
    t.boolean  "redirect_to_primary_host"
  end

  add_index "alchemy_sites", ["host", "public"], name: "alchemy_sites_public_hosts_idx", using: :btree
  add_index "alchemy_sites", ["host"], name: "index_alchemy_sites_on_host", using: :btree

  create_table "answers", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaigns", force: :cascade do |t|
    t.integer  "conference_id"
    t.string   "name"
    t.string   "utm_source"
    t.string   "utm_medium"
    t.string   "utm_term"
    t.string   "utm_content"
    t.string   "utm_campaign"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cfps", force: :cascade do |t|
    t.date     "start_date", null: false
    t.date     "end_date",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "program_id"
  end

  create_table "code_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "code_types", ["name"], name: "index_code_types_on_title", unique: true, using: :btree

  create_table "codes", force: :cascade do |t|
    t.string   "name"
    t.integer  "code_type_id"
    t.integer  "conference_id"
    t.integer  "discount"
    t.integer  "max_uses",      default: 0, null: false
    t.integer  "sponsor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "codes", ["conference_id"], name: "index_codes_on_conference_id", using: :btree
  add_index "codes", ["name"], name: "index_codes_on_name", unique: true, using: :btree
  add_index "codes", ["sponsor_id"], name: "index_codes_on_sponsor_id", using: :btree

  create_table "codes_tickets", id: false, force: :cascade do |t|
    t.integer "code_id"
    t.integer "ticket_id"
  end

  add_index "codes_tickets", ["code_id", "ticket_id"], name: "index_codes_tickets_on_code_id_and_ticket_id", unique: true, using: :btree

  create_table "comfy_cms_blocks", force: :cascade do |t|
    t.string   "identifier",     null: false
    t.text     "content"
    t.integer  "blockable_id"
    t.string   "blockable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_blocks", ["blockable_id", "blockable_type"], name: "index_comfy_cms_blocks_on_blockable_id_and_blockable_type", using: :btree
  add_index "comfy_cms_blocks", ["identifier"], name: "index_comfy_cms_blocks_on_identifier", using: :btree

  create_table "comfy_cms_categories", force: :cascade do |t|
    t.integer "site_id",          null: false
    t.string  "label",            null: false
    t.string  "categorized_type", null: false
  end

  add_index "comfy_cms_categories", ["site_id", "categorized_type", "label"], name: "index_cms_categories_on_site_id_and_cat_type_and_label", unique: true, using: :btree

  create_table "comfy_cms_categorizations", force: :cascade do |t|
    t.integer "category_id",      null: false
    t.string  "categorized_type", null: false
    t.integer "categorized_id",   null: false
  end

  add_index "comfy_cms_categorizations", ["category_id", "categorized_type", "categorized_id"], name: "index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id", unique: true, using: :btree

  create_table "comfy_cms_files", force: :cascade do |t|
    t.integer  "site_id",                                    null: false
    t.integer  "block_id"
    t.string   "label",                                      null: false
    t.string   "file_file_name",                             null: false
    t.string   "file_content_type",                          null: false
    t.integer  "file_file_size",                             null: false
    t.string   "description",       limit: 2048
    t.integer  "position",                       default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_files", ["site_id", "block_id"], name: "index_comfy_cms_files_on_site_id_and_block_id", using: :btree
  add_index "comfy_cms_files", ["site_id", "file_file_name"], name: "index_comfy_cms_files_on_site_id_and_file_file_name", using: :btree
  add_index "comfy_cms_files", ["site_id", "label"], name: "index_comfy_cms_files_on_site_id_and_label", using: :btree
  add_index "comfy_cms_files", ["site_id", "position"], name: "index_comfy_cms_files_on_site_id_and_position", using: :btree

  create_table "comfy_cms_layouts", force: :cascade do |t|
    t.integer  "site_id",                    null: false
    t.integer  "parent_id"
    t.string   "app_layout"
    t.string   "label",                      null: false
    t.string   "identifier",                 null: false
    t.text     "content"
    t.text     "css"
    t.text     "js"
    t.integer  "position",   default: 0,     null: false
    t.boolean  "is_shared",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_layouts", ["parent_id", "position"], name: "index_comfy_cms_layouts_on_parent_id_and_position", using: :btree
  add_index "comfy_cms_layouts", ["site_id", "identifier"], name: "index_comfy_cms_layouts_on_site_id_and_identifier", unique: true, using: :btree

  create_table "comfy_cms_pages", force: :cascade do |t|
    t.integer  "site_id",                        null: false
    t.integer  "layout_id"
    t.integer  "parent_id"
    t.integer  "target_page_id"
    t.string   "label",                          null: false
    t.string   "slug"
    t.string   "full_path",                      null: false
    t.text     "content_cache"
    t.integer  "position",       default: 0,     null: false
    t.integer  "children_count", default: 0,     null: false
    t.boolean  "is_published",   default: true,  null: false
    t.boolean  "is_shared",      default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_pages", ["parent_id", "position"], name: "index_comfy_cms_pages_on_parent_id_and_position", using: :btree
  add_index "comfy_cms_pages", ["site_id", "full_path"], name: "index_comfy_cms_pages_on_site_id_and_full_path", using: :btree

  create_table "comfy_cms_revisions", force: :cascade do |t|
    t.string   "record_type", null: false
    t.integer  "record_id",   null: false
    t.text     "data"
    t.datetime "created_at"
  end

  add_index "comfy_cms_revisions", ["record_type", "record_id", "created_at"], name: "index_cms_revisions_on_rtype_and_rid_and_created_at", using: :btree

  create_table "comfy_cms_sites", force: :cascade do |t|
    t.string  "label",                       null: false
    t.string  "identifier",                  null: false
    t.string  "hostname",                    null: false
    t.string  "path"
    t.string  "locale",      default: "en",  null: false
    t.boolean "is_mirrored", default: false, null: false
  end

  add_index "comfy_cms_sites", ["hostname"], name: "index_comfy_cms_sites_on_hostname", using: :btree
  add_index "comfy_cms_sites", ["is_mirrored"], name: "index_comfy_cms_sites_on_is_mirrored", using: :btree

  create_table "comfy_cms_snippets", force: :cascade do |t|
    t.integer  "site_id",                    null: false
    t.string   "label",                      null: false
    t.string   "identifier",                 null: false
    t.text     "content"
    t.integer  "position",   default: 0,     null: false
    t.boolean  "is_shared",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_snippets", ["site_id", "identifier"], name: "index_comfy_cms_snippets_on_site_id_and_identifier", unique: true, using: :btree
  add_index "comfy_cms_snippets", ["site_id", "position"], name: "index_comfy_cms_snippets_on_site_id_and_position", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "title",            limit: 50, default: ""
    t.text     "body"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "commercials", force: :cascade do |t|
    t.string   "commercial_id"
    t.string   "commercial_type"
    t.integer  "commercialable_id"
    t.string   "commercialable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  create_table "conferences", force: :cascade do |t|
    t.string   "guid",                                       null: false
    t.string   "title",                                      null: false
    t.string   "short_title",                                null: false
    t.string   "timezone",                                   null: false
    t.date     "start_date",                                 null: false
    t.date     "end_date",                                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.integer  "revision"
    t.boolean  "use_vpositions",             default: false
    t.boolean  "use_vdays",                  default: false
    t.boolean  "use_volunteers"
    t.string   "color"
    t.text     "events_per_week"
    t.text     "description"
    t.integer  "registration_limit",         default: 0
    t.string   "picture"
    t.integer  "start_hour",                 default: 9
    t.integer  "end_hour",                   default: 20
    t.string   "background_file_name"
    t.boolean  "require_itinerary"
    t.boolean  "use_pg_flow",                default: true
    t.string   "default_currency",           default: "USD"
    t.string   "braintree_merchant_account"
  end

  create_table "conferences_codes", id: false, force: :cascade do |t|
    t.integer "conference_id"
    t.integer "code_id"
  end

  add_index "conferences_codes", ["conference_id", "code_id"], name: "index_conferences_codes_on_conference_id_and_code_id", unique: true, using: :btree

  create_table "conferences_policies", id: false, force: :cascade do |t|
    t.integer "conference_id"
    t.integer "policy_id"
  end

  add_index "conferences_policies", ["conference_id", "policy_id"], name: "index_conferences_policies_on_conference_id_and_policy_id", unique: true, using: :btree

  create_table "conferences_questions", id: false, force: :cascade do |t|
    t.integer "conference_id"
    t.integer "question_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "social_tag"
    t.string   "email"
    t.string   "facebook"
    t.string   "googleplus"
    t.string   "twitter"
    t.string   "instagram"
    t.integer  "conference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sponsor_email"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "difficulty_levels", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "program_id"
  end

  create_table "email_settings", force: :cascade do |t|
    t.integer  "conference_id"
    t.boolean  "send_on_registration",                          default: false
    t.boolean  "send_on_accepted",                              default: false
    t.boolean  "send_on_rejected",                              default: false
    t.boolean  "send_on_confirmed_without_registration",        default: false
    t.text     "registration_body"
    t.text     "accepted_body"
    t.text     "rejected_body"
    t.text     "confirmed_without_registration_body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "registration_subject"
    t.string   "accepted_subject"
    t.string   "rejected_subject"
    t.string   "confirmed_without_registration_subject"
    t.boolean  "send_on_conference_dates_updated",              default: false
    t.string   "conference_dates_updated_subject"
    t.text     "conference_dates_updated_body"
    t.boolean  "send_on_conference_registration_dates_updated", default: false
    t.string   "conference_registration_dates_updated_subject"
    t.text     "conference_registration_dates_updated_body"
    t.boolean  "send_on_venue_updated",                         default: false
    t.string   "venue_updated_subject"
    t.text     "venue_updated_body"
    t.boolean  "send_on_cfp_dates_updated",                     default: false
    t.boolean  "send_on_program_schedule_public",               default: false
    t.string   "program_schedule_public_subject"
    t.string   "cfp_dates_updated_subject"
    t.text     "program_schedule_public_body"
    t.text     "cfp_dates_updated_body"
  end

  create_table "event_schedules", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "schedule_id"
    t.integer  "room_id"
    t.datetime "start_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "event_schedules", ["event_id", "schedule_id"], name: "index_event_schedules_on_event_id_and_schedule_id", unique: true, using: :btree
  add_index "event_schedules", ["event_id"], name: "index_event_schedules_on_event_id", using: :btree
  add_index "event_schedules", ["room_id"], name: "index_event_schedules_on_room_id", using: :btree
  add_index "event_schedules", ["schedule_id"], name: "index_event_schedules_on_schedule_id", using: :btree

  create_table "event_types", force: :cascade do |t|
    t.string  "title",                                   null: false
    t.integer "length",                  default: 30
    t.integer "minimum_abstract_length", default: 0
    t.integer "maximum_abstract_length", default: 500
    t.string  "color"
    t.string  "description"
    t.integer "program_id"
    t.boolean "internal_event",          default: false
  end

  create_table "event_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "event_role", default: "participant", null: false
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.string   "guid",                                         null: false
    t.integer  "event_type_id"
    t.string   "title",                                        null: false
    t.string   "subtitle"
    t.string   "state",                        default: "new", null: false
    t.string   "progress",                     default: "new", null: false
    t.string   "language"
    t.datetime "start_time"
    t.text     "abstract"
    t.text     "description"
    t.boolean  "public",                       default: true
    t.text     "proposal_additional_speakers"
    t.integer  "track_id"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "require_registration"
    t.integer  "difficulty_level_id"
    t.integer  "week"
    t.boolean  "is_highlight",                 default: false
    t.integer  "program_id"
    t.integer  "max_attendees"
    t.string   "slug"
    t.integer  "ticket_id"
  end

  add_index "events", ["slug"], name: "index_events_on_slug", using: :btree
  add_index "events", ["ticket_id"], name: "index_events_on_ticket_id", using: :btree

  create_table "events_back", id: false, force: :cascade do |t|
    t.integer  "id"
    t.string   "guid"
    t.integer  "event_type_id"
    t.string   "title"
    t.string   "subtitle"
    t.string   "state"
    t.string   "progress"
    t.string   "language"
    t.datetime "start_time"
    t.text     "abstract"
    t.text     "description"
    t.boolean  "public"
    t.text     "proposal_additional_speakers"
    t.integer  "track_id"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "require_registration"
    t.integer  "difficulty_level_id"
    t.integer  "week"
    t.boolean  "is_highlight"
    t.integer  "program_id"
    t.integer  "max_attendees"
  end

  create_table "events_registrations", force: :cascade do |t|
    t.integer  "registration_id"
    t.integer  "event_id"
    t.boolean  "attended",        default: false, null: false
    t.datetime "created_at"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "lodgings", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website_link"
    t.integer  "conference_id"
    t.string   "picture"
  end

  create_table "openids", force: :cascade do |t|
    t.string   "provider"
    t.string   "email"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: :cascade do |t|
    t.string   "last4"
    t.integer  "amount"
    t.string   "authorization_code"
    t.integer  "status",             default: 0, null: false
    t.integer  "user_id",                        null: false
    t.integer  "conference_id",                  null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "policies", force: :cascade do |t|
    t.string   "title"
    t.integer  "conference_id"
    t.boolean  "global"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", force: :cascade do |t|
    t.integer  "conference_id"
    t.integer  "rating",               default: 0
    t.boolean  "schedule_public",      default: false
    t.boolean  "schedule_fluid",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "languages"
    t.boolean  "blind_voting",         default: false
    t.datetime "voting_start_date"
    t.datetime "voting_end_date"
    t.integer  "selected_schedule_id"
  end

  add_index "programs", ["selected_schedule_id"], name: "index_programs_on_selected_schedule_id", using: :btree

  create_table "qanswers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qanswers_registrations", id: false, force: :cascade do |t|
    t.integer "registration_id", null: false
    t.integer "qanswer_id",      null: false
  end

  create_table "question_types", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.integer  "question_type_id"
    t.integer  "conference_id"
    t.boolean  "global"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_authentication_devise_roles", force: :cascade do |t|
    t.string "title"
  end

  create_table "refinery_authentication_devise_roles_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "refinery_authentication_devise_roles_users", ["role_id", "user_id"], name: "refinery_roles_users_role_id_user_id", using: :btree
  add_index "refinery_authentication_devise_roles_users", ["user_id", "role_id"], name: "refinery_roles_users_user_id_role_id", using: :btree

  create_table "refinery_authentication_devise_user_plugins", force: :cascade do |t|
    t.integer "user_id"
    t.string  "name"
    t.integer "position"
  end

  add_index "refinery_authentication_devise_user_plugins", ["name"], name: "index_refinery_authentication_devise_user_plugins_on_name", using: :btree
  add_index "refinery_authentication_devise_user_plugins", ["user_id", "name"], name: "refinery_user_plugins_user_id_name", unique: true, using: :btree

  create_table "refinery_authentication_devise_users", force: :cascade do |t|
    t.string   "username",               null: false
    t.string   "email",                  null: false
    t.string   "encrypted_password",     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "sign_in_count"
    t.datetime "remember_created_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "full_name"
  end

  add_index "refinery_authentication_devise_users", ["id"], name: "index_refinery_authentication_devise_users_on_id", using: :btree
  add_index "refinery_authentication_devise_users", ["slug"], name: "index_refinery_authentication_devise_users_on_slug", using: :btree

  create_table "refinery_blog_categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "refinery_blog_categories", ["id"], name: "index_refinery_blog_categories_on_id", using: :btree
  add_index "refinery_blog_categories", ["slug"], name: "index_refinery_blog_categories_on_slug", using: :btree

  create_table "refinery_blog_categories_blog_posts", force: :cascade do |t|
    t.integer "blog_category_id"
    t.integer "blog_post_id"
  end

  add_index "refinery_blog_categories_blog_posts", ["blog_category_id", "blog_post_id"], name: "index_blog_categories_blog_posts_on_bc_and_bp", using: :btree

  create_table "refinery_blog_category_translations", force: :cascade do |t|
    t.integer  "refinery_blog_category_id", null: false
    t.string   "locale",                    null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "title"
    t.string   "slug"
  end

  add_index "refinery_blog_category_translations", ["locale"], name: "index_refinery_blog_category_translations_on_locale", using: :btree
  add_index "refinery_blog_category_translations", ["refinery_blog_category_id"], name: "index_a0315945e6213bbe0610724da0ee2de681b77c31", using: :btree

  create_table "refinery_blog_comments", force: :cascade do |t|
    t.integer  "blog_post_id"
    t.boolean  "spam"
    t.string   "name"
    t.string   "email"
    t.text     "body"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "refinery_blog_comments", ["blog_post_id"], name: "index_refinery_blog_comments_on_blog_post_id", using: :btree
  add_index "refinery_blog_comments", ["id"], name: "index_refinery_blog_comments_on_id", using: :btree

  create_table "refinery_blog_post_translations", force: :cascade do |t|
    t.integer  "refinery_blog_post_id", null: false
    t.string   "locale",                null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.text     "body"
    t.text     "custom_teaser"
    t.string   "custom_url"
    t.string   "slug"
    t.string   "title"
  end

  add_index "refinery_blog_post_translations", ["locale"], name: "index_refinery_blog_post_translations_on_locale", using: :btree
  add_index "refinery_blog_post_translations", ["refinery_blog_post_id"], name: "index_refinery_blog_post_translations_on_refinery_blog_post_id", using: :btree

  create_table "refinery_blog_posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "draft"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "custom_url"
    t.text     "custom_teaser"
    t.string   "source_url"
    t.string   "source_url_title"
    t.integer  "access_count",     default: 0
    t.string   "slug"
    t.integer  "image_id"
  end

  add_index "refinery_blog_posts", ["access_count"], name: "index_refinery_blog_posts_on_access_count", using: :btree
  add_index "refinery_blog_posts", ["id"], name: "index_refinery_blog_posts_on_id", using: :btree
  add_index "refinery_blog_posts", ["slug"], name: "index_refinery_blog_posts_on_slug", using: :btree

  create_table "refinery_image_translations", force: :cascade do |t|
    t.integer  "refinery_image_id", null: false
    t.string   "locale",            null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "image_alt"
    t.string   "image_title"
  end

  add_index "refinery_image_translations", ["locale"], name: "index_refinery_image_translations_on_locale", using: :btree
  add_index "refinery_image_translations", ["refinery_image_id"], name: "index_refinery_image_translations_on_refinery_image_id", using: :btree

  create_table "refinery_images", force: :cascade do |t|
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_title"
    t.string   "image_alt"
  end

  create_table "refinery_news_item_translations", force: :cascade do |t|
    t.integer  "refinery_news_item_id", null: false
    t.string   "locale",                null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "title"
    t.text     "body"
    t.string   "source"
    t.string   "slug"
  end

  add_index "refinery_news_item_translations", ["locale"], name: "index_refinery_news_item_translations_on_locale", using: :btree
  add_index "refinery_news_item_translations", ["refinery_news_item_id"], name: "index_refinery_news_item_translations_fk", using: :btree

  create_table "refinery_news_items", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "publish_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "image_id"
    t.datetime "expiration_date"
    t.string   "source"
    t.string   "slug"
  end

  add_index "refinery_news_items", ["id"], name: "index_refinery_news_items_on_id", using: :btree

  create_table "refinery_page_part_translations", force: :cascade do |t|
    t.integer  "refinery_page_part_id", null: false
    t.string   "locale",                null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.text     "body"
  end

  add_index "refinery_page_part_translations", ["locale"], name: "index_refinery_page_part_translations_on_locale", using: :btree
  add_index "refinery_page_part_translations", ["refinery_page_part_id"], name: "index_refinery_page_part_translations_on_refinery_page_part_id", using: :btree

  create_table "refinery_page_parts", force: :cascade do |t|
    t.integer  "refinery_page_id"
    t.string   "slug"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "refinery_page_parts", ["id"], name: "index_refinery_page_parts_on_id", using: :btree
  add_index "refinery_page_parts", ["refinery_page_id"], name: "index_refinery_page_parts_on_refinery_page_id", using: :btree

  create_table "refinery_page_translations", force: :cascade do |t|
    t.integer  "refinery_page_id", null: false
    t.string   "locale",           null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "title"
    t.string   "custom_slug"
    t.string   "menu_title"
    t.string   "slug"
  end

  add_index "refinery_page_translations", ["locale"], name: "index_refinery_page_translations_on_locale", using: :btree
  add_index "refinery_page_translations", ["refinery_page_id"], name: "index_refinery_page_translations_on_refinery_page_id", using: :btree

  create_table "refinery_pages", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "path"
    t.string   "slug"
    t.string   "custom_slug"
    t.boolean  "show_in_menu",        default: true
    t.string   "link_url"
    t.string   "menu_match"
    t.boolean  "deletable",           default: true
    t.boolean  "draft",               default: false
    t.boolean  "skip_to_first_child", default: false
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "view_template"
    t.string   "layout_template"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "refinery_pages", ["depth"], name: "index_refinery_pages_on_depth", using: :btree
  add_index "refinery_pages", ["id"], name: "index_refinery_pages_on_id", using: :btree
  add_index "refinery_pages", ["lft"], name: "index_refinery_pages_on_lft", using: :btree
  add_index "refinery_pages", ["parent_id"], name: "index_refinery_pages_on_parent_id", using: :btree
  add_index "refinery_pages", ["rgt"], name: "index_refinery_pages_on_rgt", using: :btree

  create_table "refinery_resource_translations", force: :cascade do |t|
    t.integer  "refinery_resource_id", null: false
    t.string   "locale",               null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "resource_title"
  end

  add_index "refinery_resource_translations", ["locale"], name: "index_refinery_resource_translations_on_locale", using: :btree
  add_index "refinery_resource_translations", ["refinery_resource_id"], name: "index_refinery_resource_translations_on_refinery_resource_id", using: :btree

  create_table "refinery_resources", force: :cascade do |t|
    t.string   "file_mime_type"
    t.string   "file_name"
    t.integer  "file_size"
    t.string   "file_uid"
    t.string   "file_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_settings", force: :cascade do |t|
    t.string   "name"
    t.text     "value"
    t.boolean  "destroyable",     default: true
    t.string   "scoping"
    t.boolean  "restricted",      default: false
    t.string   "form_value_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "title"
  end

  add_index "refinery_settings", ["name"], name: "index_refinery_settings_on_name", using: :btree

  create_table "registration_periods", force: :cascade do |t|
    t.integer  "conference_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", force: :cascade do |t|
    t.integer  "conference_id"
    t.datetime "arrival"
    t.datetime "departure"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "other_special_needs"
    t.boolean  "attended",            default: false
    t.boolean  "volunteer"
    t.integer  "user_id"
    t.integer  "week"
  end

  create_table "registrations_vchoices", id: false, force: :cascade do |t|
    t.integer "registration_id"
    t.integer "vchoice_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.integer  "resource_id"
    t.string   "resource_type"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.string  "guid",     null: false
    t.string  "name",     null: false
    t.integer "size"
    t.integer "venue_id", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "schedules", ["program_id"], name: "index_schedules_on_program_id", using: :btree

  create_table "seo_meta", force: :cascade do |t|
    t.integer  "seo_meta_id"
    t.string   "seo_meta_type"
    t.string   "browser_title"
    t.text     "meta_description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "seo_meta", ["id"], name: "index_seo_meta_on_id", using: :btree
  add_index "seo_meta", ["seo_meta_id", "seo_meta_type"], name: "id_type_index_on_seo_meta", using: :btree

  create_table "splashpages", force: :cascade do |t|
    t.integer  "conference_id"
    t.boolean  "public"
    t.boolean  "include_tracks"
    t.boolean  "include_program"
    t.boolean  "include_social_media"
    t.boolean  "include_venue"
    t.boolean  "include_tickets"
    t.boolean  "include_registrations"
    t.boolean  "include_sponsors"
    t.boolean  "include_lodgings"
    t.string   "banner_photo_file_name"
    t.string   "banner_photo_content_type"
    t.integer  "banner_photo_file_size"
    t.datetime "banner_photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "include_cfp",               default: false
    t.boolean  "include_activities",        default: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "website_url"
    t.string   "logo_file_name"
    t.integer  "sponsorship_level_id"
    t.integer  "conference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture"
  end

  create_table "sponsorship_infos", force: :cascade do |t|
    t.text     "description"
    t.integer  "conference_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "prospectus"
  end

  add_index "sponsorship_infos", ["conference_id"], name: "index_sponsorship_infos_on_conference_id", using: :btree

  create_table "sponsorship_levels", force: :cascade do |t|
    t.string   "title"
    t.integer  "conference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "storytime_actions", force: :cascade do |t|
    t.string   "name"
    t.string   "guid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "storytime_actions", ["guid"], name: "index_storytime_actions_on_guid", using: :btree

  create_table "storytime_autosaves", force: :cascade do |t|
    t.text     "content"
    t.integer  "autosavable_id"
    t.string   "autosavable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "storytime_autosaves", ["autosavable_type", "autosavable_id"], name: "autosavable_index", using: :btree
  add_index "storytime_autosaves", ["site_id"], name: "index_storytime_autosaves_on_site_id", using: :btree

  create_table "storytime_comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "storytime_comments", ["post_id"], name: "index_storytime_comments_on_post_id", using: :btree
  add_index "storytime_comments", ["site_id"], name: "index_storytime_comments_on_site_id", using: :btree
  add_index "storytime_comments", ["user_id"], name: "index_storytime_comments_on_user_id", using: :btree

  create_table "storytime_media", force: :cascade do |t|
    t.string   "file"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "storytime_media", ["site_id"], name: "index_storytime_media_on_site_id", using: :btree
  add_index "storytime_media", ["user_id"], name: "index_storytime_media_on_user_id", using: :btree

  create_table "storytime_memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "storytime_role_id"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "storytime_memberships", ["site_id"], name: "index_storytime_memberships_on_site_id", using: :btree
  add_index "storytime_memberships", ["storytime_role_id"], name: "index_storytime_memberships_on_storytime_role_id", using: :btree
  add_index "storytime_memberships", ["user_id"], name: "index_storytime_memberships_on_user_id", using: :btree

  create_table "storytime_permissions", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "action_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "storytime_permissions", ["action_id"], name: "index_storytime_permissions_on_action_id", using: :btree
  add_index "storytime_permissions", ["role_id"], name: "index_storytime_permissions_on_role_id", using: :btree
  add_index "storytime_permissions", ["site_id"], name: "index_storytime_permissions_on_site_id", using: :btree

  create_table "storytime_posts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "type"
    t.string   "title"
    t.string   "slug"
    t.text     "content"
    t.text     "excerpt"
    t.datetime "published_at"
    t.integer  "featured_media_id"
    t.boolean  "featured",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "secondary_media_id"
    t.integer  "site_id"
    t.boolean  "notifications_enabled", default: false
    t.datetime "notifications_sent_at"
    t.integer  "blog_id"
  end

  add_index "storytime_posts", ["blog_id"], name: "index_storytime_posts_on_blog_id", using: :btree
  add_index "storytime_posts", ["slug"], name: "index_storytime_posts_on_slug", using: :btree
  add_index "storytime_posts", ["user_id"], name: "index_storytime_posts_on_user_id", using: :btree

  create_table "storytime_roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "storytime_roles", ["name"], name: "index_storytime_roles_on_name", using: :btree

  create_table "storytime_sites", force: :cascade do |t|
    t.string   "title"
    t.integer  "post_slug_style",         default: 0
    t.string   "ga_tracking_id"
    t.integer  "root_post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subscription_email_from"
    t.string   "layout"
    t.string   "disqus_forum_shortname"
    t.integer  "user_id"
    t.string   "custom_domain"
    t.string   "discourse_name"
  end

  add_index "storytime_sites", ["root_post_id"], name: "index_storytime_sites_on_root_post_id", using: :btree
  add_index "storytime_sites", ["user_id"], name: "index_storytime_sites_on_user_id", using: :btree

  create_table "storytime_snippets", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "storytime_snippets", ["name"], name: "index_storytime_snippets_on_name", using: :btree

  create_table "storytime_subscriptions", force: :cascade do |t|
    t.string   "email"
    t.boolean  "subscribed", default: true
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "storytime_subscriptions", ["token"], name: "index_storytime_subscriptions_on_token", using: :btree

  create_table "storytime_taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "storytime_taggings", ["post_id"], name: "index_storytime_taggings_on_post_id", using: :btree
  add_index "storytime_taggings", ["site_id"], name: "index_storytime_taggings_on_site_id", using: :btree
  add_index "storytime_taggings", ["tag_id"], name: "index_storytime_taggings_on_tag_id", using: :btree

  create_table "storytime_tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  create_table "storytime_versions", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "versionable_id"
    t.string   "versionable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "storytime_versions", ["site_id"], name: "index_storytime_versions_on_site_id", using: :btree
  add_index "storytime_versions", ["user_id"], name: "index_storytime_versions_on_user_id", using: :btree
  add_index "storytime_versions", ["versionable_type", "versionable_id"], name: "versionable_index", using: :btree

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "conference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "targets", force: :cascade do |t|
    t.integer  "conference_id"
    t.integer  "campaign_id"
    t.date     "due_date"
    t.integer  "target_count"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ticket_purchases", force: :cascade do |t|
    t.integer  "ticket_id"
    t.integer  "conference_id"
    t.boolean  "paid",          default: false
    t.datetime "created_at"
    t.integer  "quantity",      default: 1
    t.integer  "user_id"
    t.integer  "payment_id"
    t.integer  "code_id"
    t.integer  "event_id"
  end

  add_index "ticket_purchases", ["conference_id", "code_id"], name: "index_ticket_purchases_on_conference_id_and_code_id", using: :btree
  add_index "ticket_purchases", ["event_id"], name: "index_ticket_purchases_on_event_id", using: :btree

  create_table "tickets", force: :cascade do |t|
    t.integer "conference_id"
    t.string  "title",                          null: false
    t.text    "description"
    t.integer "price_cents",    default: 0,     null: false
    t.string  "price_currency", default: "USD", null: false
    t.boolean "hidden",         default: false
    t.integer "position"
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "guid",        null: false
    t.string   "name",        null: false
    t.text     "description"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "program_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "email_public"
    t.text     "biography"
    t.string   "nickname"
    t.string   "affiliation"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "mobile"
    t.string   "tshirt"
    t.string   "languages"
    t.text     "volunteer_experience"
    t.boolean  "is_admin",               default: false
    t.string   "username"
    t.boolean  "is_disabled",            default: false
    t.string   "avatar"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "storytime_name"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "users_roles", force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "vchoices", force: :cascade do |t|
    t.integer "vday_id"
    t.integer "vposition_id"
  end

  create_table "vdays", force: :cascade do |t|
    t.integer  "conference_id"
    t.date     "day"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", force: :cascade do |t|
    t.string   "guid"
    t.string   "name"
    t.string   "website"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "street"
    t.string   "postalcode"
    t.string   "city"
    t.string   "country"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "conference_id"
    t.string   "picture"
    t.string   "state"
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
    t.integer  "conference_id"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "visits", force: :cascade do |t|
    t.uuid     "visitor_id"
    t.string   "ip"
    t.text     "user_agent"
    t.text     "referrer"
    t.text     "landing_page"
    t.integer  "user_id"
    t.string   "referring_domain"
    t.string   "search_keyword"
    t.string   "browser"
    t.string   "os"
    t.string   "device_type"
    t.string   "country"
    t.string   "region"
    t.string   "city"
    t.string   "utm_source"
    t.string   "utm_medium"
    t.string   "utm_term"
    t.string   "utm_content"
    t.string   "utm_campaign"
    t.datetime "started_at"
  end

  add_index "visits", ["user_id"], name: "index_visits_on_user_id", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "vpositions", force: :cascade do |t|
    t.integer  "conference_id"
    t.string   "title",         null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "alchemy_cells", "alchemy_pages", column: "page_id", name: "alchemy_cells_page_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "alchemy_contents", "alchemy_elements", column: "element_id", name: "alchemy_contents_element_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "alchemy_elements", "alchemy_cells", column: "cell_id", name: "alchemy_elements_cell_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "alchemy_elements", "alchemy_pages", column: "page_id", name: "alchemy_elements_page_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "codes", "code_types"
  add_foreign_key "codes", "conferences"
  add_foreign_key "codes", "sponsors"
  add_foreign_key "codes_tickets", "codes"
  add_foreign_key "codes_tickets", "tickets"
  add_foreign_key "conferences_codes", "codes"
  add_foreign_key "conferences_codes", "conferences"
  add_foreign_key "conferences_policies", "conferences"
  add_foreign_key "conferences_policies", "policies"
  add_foreign_key "events", "tickets"
  add_foreign_key "policies", "conferences"
  add_foreign_key "sponsorship_infos", "conferences"
  add_foreign_key "ticket_purchases", "codes"
  add_foreign_key "ticket_purchases", "events"
end
