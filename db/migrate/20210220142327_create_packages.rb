class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    add_index :servers, [:name], unique: true
  end
end
