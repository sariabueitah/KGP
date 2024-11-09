class AddCompletedToAdvances < ActiveRecord::Migration[8.0]
  def change
    add_column :advances, :completed, :boolean
  end
end
