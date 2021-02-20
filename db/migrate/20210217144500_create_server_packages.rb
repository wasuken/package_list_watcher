class CreateServerPackages < ActiveRecord::Migration[6.0]
  def change
    create_table :server_packages do |t|
      t.references :server, null: false, foreign_key: true
      t.references :package, null: false, foreign_key: true

      t.timestamps
    end
  end
end
