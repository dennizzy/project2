ActiveRecord::Schema.define(version: 20151110183807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "teams", force: :cascade do |t|
    t.string "school_name"
    t.string "photo_url"
    t.string "state"
  end

  create_table "players", force: :cascade do |t|
    t.string  "name"
    t.string  "photo_url"
    t.string  "position"
    t.integer  "year"
    t.integer "team_id"
  end
end
