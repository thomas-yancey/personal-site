class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :address, null: false
      t.text :message, null: false

      t.timestamps null: false
    end
  end
end
