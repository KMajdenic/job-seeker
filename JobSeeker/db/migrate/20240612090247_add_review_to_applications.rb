class AddReviewToApplications < ActiveRecord::Migration[7.1]
  def up
    add_reference :applications, :review, foreign_key: true
  end
  def down
    remove_reference :applications, :review
  end
end
