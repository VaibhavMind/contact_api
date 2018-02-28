class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :name ,:default => false
      t.string :attachment,:default => false

      t.timestamps
    end
  end
end
