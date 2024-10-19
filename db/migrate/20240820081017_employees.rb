class Employees < ActiveRecord::Migration[7.2]
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

      t.timestamps
    end

    create_table :positions do |t|
      t.string :title

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

    create_table :banks do |t|
      t.string :name
      t.string :branch
      t.string :iban
      t.references :employee

      t.timestamps
    end

    create_table :advances do |t|
      t.float :amount
      t.float :payment
      t.date :start_date
      t.date :end_date
      t.references :employee

      t.timestamps
    end

    create_table :paycuts do |t|
      t.string :reason
      t.boolean :recurring
      t.float :amount
      t.float :percent_amount

      t.timestamps
    end
  end
end
