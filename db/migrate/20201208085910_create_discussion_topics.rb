class CreateDiscussionTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :discussion_topics do |t|
      t.string :title
      t.references :campaign, foreign_key: true, index: true

      t.timestamps
    end
  end
end
