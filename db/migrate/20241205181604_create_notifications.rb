class CreateNotifications < ActiveRecord::Migration[8.0]
  def change
    create_table :notifications do |t|
      t.string :message
      t.references :notifiable, polymorphic: true
      t.timestamps
    end
  end
end
