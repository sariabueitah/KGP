class AddSocialSecurityNumberToEmployees < ActiveRecord::Migration[8.0]
  def change
    add_column :employees, :social_security_number, :text
    add_column :employees, :income_tax_number, :text
    add_column :employees, :marital_status, :integer
    add_column :employees, :has_dependants, :boolean
  end
end
