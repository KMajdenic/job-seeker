class AddSetupCompleteToUsers < ActiveRecord::Migration[7.1]
  def up
    add_column :users, :setup_complete, :boolean, default: false
  end

  def down
    remove_column :users, :setup_complete, :boolean
  end
end
