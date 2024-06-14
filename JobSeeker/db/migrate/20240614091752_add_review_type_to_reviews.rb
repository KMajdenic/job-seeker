class AddReviewTypeToReviews < ActiveRecord::Migration[7.1]
  def up
    add_column :reviews, :review_type, :integer, default: 0
  end
  def down
    remove_column :reviews, :review_type
  end
end
