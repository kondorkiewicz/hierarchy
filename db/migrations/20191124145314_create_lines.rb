Hanami::Model.migration do
  change do
    create_table :lines do
      primary_key :id
      foreign_key :crag_id, :crags, null: false

      column :name, String
      column :grade, String
      column :kind, String

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
