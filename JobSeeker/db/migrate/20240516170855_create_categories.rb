class CreateCategories < ActiveRecord::Migration[7.1]
  def up
    create_table :categories do |t|
      t.string :title

      t.timestamps
    end
  end
  def down
    drop_table :categories
  end
end
