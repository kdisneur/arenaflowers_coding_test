class CreateDictionaries < ActiveRecord::Migration
  def change
    create_table :dictionaries do |table|
      table.string :name
      table.string :state
      table.string :file
      table.float  :elapsed_time
    end

    add_index :dictionaries, :name, unique: true
  end
end
