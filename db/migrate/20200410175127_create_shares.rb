class CreateShares < ActiveRecord::Migration[6.0]
  def change
    create_table :shares do |t|
      t.references :user, null: false, foreign_key: true
      t.references :place, null: false, index: true, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
