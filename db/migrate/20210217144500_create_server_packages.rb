class CreateServerPackages < ActiveRecord::Migration[6.0]
  def change
    create_table :server_packages do |t|
      t.references :servers, null: false, foreign_key: true
      t.references :packages, null: false, foreign_key: true
      t.string :version

      t.timestamps
    end
  end
end
