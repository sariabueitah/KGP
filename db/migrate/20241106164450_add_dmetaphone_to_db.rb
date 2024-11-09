class AddDmetaphoneToDb < ActiveRecord::Migration[7.2]
  def up
    execute 'CREATE EXTENSION fuzzystrmatch;'
  end

  def down
    execute 'DROP EXTENSION fuzzystrmatch;'
  end
end
