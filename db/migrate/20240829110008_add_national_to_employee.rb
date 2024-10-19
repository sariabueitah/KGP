class AddNationalToEmployee < ActiveRecord::Migration[7.2]
  def change
    add_column :employees, :national, :boolean, default: true
    add_column :employees, :nationality, :string
    add_column :employees, :passport_number, :string
  end
end
