module CreateTableBundles

import SearchLight.Migrations: create_table, column, primary_key, add_index, drop_table

function up()
  create_table(:bundles) do
    [
      primary_key()
      column(:name, :string, limit=50)
      column(:books, :string)
      column(:type, :int)
    ]
  end
  add_index(:bundles, :name)
end

function down()
  drop_table(:bundles)
end

end
