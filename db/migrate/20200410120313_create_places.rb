class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :name
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false
      t.boolean :is_public, null: false, default: true

      t.timestamps
    end
  end
end
