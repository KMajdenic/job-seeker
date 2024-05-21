class AddCategoryIdToClassfield < ActiveRecord::Migration[7.1]
  def up
    add_reference :classfields, :category, null: false, foreign_key: true
  end
  def down
    remove_reference :classfields, :category
  end
end
