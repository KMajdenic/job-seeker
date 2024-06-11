class CreateUserClassfields < ActiveRecord::Migration[7.1]
  def up
    create_table :applications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :classfield, null: false, foreign_key: true
      t.boolean :accepted, default: false
      t.string :status, default: "pending", null: false

      t.timestamps
    end
  end

  def down
    drop_table :applications
  end
end
