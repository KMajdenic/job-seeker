class CreateClassfieldTags < ActiveRecord::Migration[7.1]
  def change
    create_table :classfield_tags do |t|
      t.references :classfield, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
