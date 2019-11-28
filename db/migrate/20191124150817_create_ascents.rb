ROM::SQL.migration do
  change do
    create_table :ascents do
      primary_key :id
      foreign_key :user_id, :users, null: false
      foreign_key :line_id, :lines, null: false

      column :style, String, null: false
      column :when, Date, null: false
      column :belayer, String

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
