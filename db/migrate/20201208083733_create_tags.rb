class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
    add_index :tags, :parent_id
  end
end
