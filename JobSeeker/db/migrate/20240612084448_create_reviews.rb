class CreateReviews < ActiveRecord::Migration[7.1]
  def up
    create_table :reviews do |t|
      t.integer :rating
      t.text :note
      t.references :user, null: false, foreign_key: true
      t.references :classfield, null: false, foreign_key: true

      t.timestamps
    end
  end
  def down
    drop_table :reviews
  end
end
