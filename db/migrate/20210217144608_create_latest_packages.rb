class CreateLatestPackages < ActiveRecord::Migration[6.0]
  def change
    create_table :latest_packages do |t|
      t.references :packages, null: false, foreign_key: true

      t.timestamps
    end
  end
end
