class CreateReviews < ActiveRecord::Migration[7.1]
  def up
    create_table :reviews do |t|
      t.integer :rating
      t.text :note
      t.bigint :user_id, null: false
      t.bigint :classfield_id, null: false
      t.bigint :application_id
      t.timestamps null: false
    end

    add_index :reviews, :user_id, name: "index_reviews_on_user_id"
    add_index :reviews, :classfield_id, name: "index_reviews_on_classfield_id"
    add_index :reviews, :application_id, name: "index_reviews_on_application_id"
  end
  def down
    remove_index :reviews, name: "index_reviews_on_user_id"
    remove_index :reviews, name: "index_reviews_on_classfield_id"
    remove_index :reviews, name: "index_reviews_on_application_id"

    drop_table :reviews
  end

end
