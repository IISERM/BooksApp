module CreateTableBooks

import SearchLight.Migrations: create_table, column, primary_key, add_index, drop_table

function up()
  create_table(:books) do
    [
      primary_key()
      column(:name, :string, limit=50)
      column(:author, :string, limit=30)
      column(:description, :string, limit=150)
      column(:has_ocr, :bool)
      column(:has_index, :bool)
      column(:has_inlinks, :bool)
    ]
  end
  add_index(:books, :name)
end

function down()
  drop_table(:books)
end

end

#=
select * from tbl 
where 
  name LIKE "%$(query)%" OR 
  author LIKE "%$(query)%" OR 
  description LIKE "%$(query)%"

  SELECT name+author+description as st1 where st1 like "%Physics%"
  
=#
