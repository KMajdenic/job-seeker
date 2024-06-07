class CreateJoinTableClassfieldsTags < ActiveRecord::Migration[7.1]
  def up
    create_join_table :classfields, :tags do |t|
      t.index [:classfield_id, :tag_id]
      t.index [:tag_id, :classfield_id]
    end
  end
  def down
    drop_join_table :classfields, :tags do |t|
      t.index [:classfield_id, :tag_id]
      t.index [:tag_id, :classfield_id]
    end
  end
end
