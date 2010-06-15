class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :company
      t.string :address
      t.string :tel

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
