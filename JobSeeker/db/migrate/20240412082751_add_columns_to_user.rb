class AddColumnsToUser < ActiveRecord::Migration[7.1]
  def up
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :phone_number, :string
    add_column :users, :bio, :text
    # add_column :users, :reviews, Review[]
    # add_column :users, :past_jobs, Job[]
  end
  def down
    remove_column :users, :name, :string
    remove_column :users, :surname, :string
    remove_column :users, :phone_number, :string
    remove_column :users, :bio, :text
    # remove_column :users, :reviews, Review[]
    # remove_column :users, :past_jobs, Job[]
  end
end
