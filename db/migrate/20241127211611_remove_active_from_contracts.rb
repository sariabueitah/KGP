class RemoveActiveFromContracts < ActiveRecord::Migration[8.0]
  def change
    remove_column :contracts, :active, :boolean
  end
end
