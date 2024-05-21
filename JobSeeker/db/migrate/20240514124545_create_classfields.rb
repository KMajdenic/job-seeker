class CreateClassfields < ActiveRecord::Migration[7.1]
  def up
    create_table :classfields do |t|
      t.string :title
      t.text :description
      t.text :tags, array: true, default: []
      t.references :creator, null: false, foreign_key: {to_table: :users}
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end

  def down
    drop_table :classfields
  end
end
