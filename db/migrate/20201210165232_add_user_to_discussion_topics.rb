class AddUserToDiscussionTopics < ActiveRecord::Migration[6.0]
  def change
    add_reference :discussion_topics, :user, foreign_key: true, index: true
  end
end
