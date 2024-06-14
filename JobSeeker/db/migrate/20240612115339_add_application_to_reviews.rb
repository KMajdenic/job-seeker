class AddApplicationToReviews < ActiveRecord::Migration[7.1]
  def up
    add_reference :reviews, :application, foreign_key: true
  end
  def down
    remove_reference :reviews, :application
  end
end
