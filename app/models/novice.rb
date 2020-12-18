class Novice < User
  has_many :discussion_topics, foreign_key: 'user_id'
end
