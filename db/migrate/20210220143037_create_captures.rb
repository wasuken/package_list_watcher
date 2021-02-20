class CreateCaptures < ActiveRecord::Migration[6.0]
  def change
    create_table :captures do |t|
      t.references :server, null: false, foreign_key: true
      t.references :package_version, null: false, foreign_key: true

      t.timestamps
    end
    add_index :servers, [:server_id, :package_version_id], unique: true
  end
end
