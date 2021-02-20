class CreateLatestPackages < ActiveRecord::Migration[6.0]
  def change
    create_table :latest_packages do |t|
      t.references :package, null: false, foreign_key: true

      t.timestamps
    end
  end
end
