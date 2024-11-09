class AddTrigramExtensionToDb < ActiveRecord::Migration[7.2]
  def up
    execute "CREATE EXTENSION pg_trgm;"
  end

  def down 
    execute "DROP EXTENSION pg_trgm;"
  end
end
