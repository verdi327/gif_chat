class CreateBaseProject < ActiveRecord::Migration
  def change
    create_table "conversations", force: true do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "messages", force: true do |t|
      t.text     "body"
      t.string   "media_url"
      t.integer  "conversation_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "participants", force: true do |t|
      t.integer  "user_id"
      t.integer  "conversation_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "users", force: true do |t|
      t.string   "email"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "first_name"
      t.string   "last_name"
      t.string   "auth_token"
    end
  end
end
