class Employees < ActiveRecord::Migration[8.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :father_name
      t.string :grandfather_name
      t.string :family_name

      t.string :ar_first_name
      t.string :ar_father_name
      t.string :ar_grandfather_name
      t.string :ar_family_name

      t.string :nid

      t.string :email
      t.string :phone_number
      t.string :e_phone_number

      t.boolean :national, default: true
      t.string :nationality
      t.string :passport_number

      t.string :social_security_number
      t.string :income_tax_number
      t.integer :marital_status
      t.boolean :has_dependants

      t.timestamps
    end

    create_table :positions do |t|
      t.string :title
      t.string :ar_title

      t.timestamps
    end

    create_table :contracts do |t|
      t.date :start_date
      t.date :end_date
      t.float :salary
      t.boolean :active
      t.references :employee
      t.references :position

      t.timestamps
    end

    create_table :allowances do |t|
      t.string :name
      t.string :ar_name

      t.timestamps
    end

    create_table :salary_allowances do |t|
      t.references :allowance
      t.float :amount
      t.boolean :tax_deductible
      t.boolean :social_security_deductible
      t.references :contract

      t.timestamps
    end

    create_table :notifications do |t|
      t.string :message
      t.string :type
      t.references :notifiable, polymorphic: true
      t.timestamps
    end
  end
end
