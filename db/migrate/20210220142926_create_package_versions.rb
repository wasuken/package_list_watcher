class CreatePackageVersions < ActiveRecord::Migration[6.0]
  def change
    create_table :package_versions do |t|
      t.references :package, null: false, foreign_key: true
      t.string :version

      t.timestamps
    end
    add_index :servers, [:package_id, :version], unique: true
  end
end
