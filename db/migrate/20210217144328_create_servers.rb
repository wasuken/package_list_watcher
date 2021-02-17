class CreateServers < ActiveRecord::Migration[6.0]
  def change
    create_table :servers do |t|
      t.string :name
      t.string :pac_type
      t.string :arch

      t.timestamps
    end
  end
end
