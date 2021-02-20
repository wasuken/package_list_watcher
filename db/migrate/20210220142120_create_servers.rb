class CreateServers < ActiveRecord::Migration[6.0]
  def change
    create_table :servers do |t|
      t.string :name
      t.string :pac_type
      t.string :arch
      t.string :other_info

      t.timestamps
    end
    add_index :servers, [:name, :pac_type], unique: true
  end
end
