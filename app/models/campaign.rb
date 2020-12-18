class Campaign < ApplicationRecord
  belongs_to :expert, class_name: "User", foreign_key: 'user_id'

  has_many :todos
  has_many :tags
  has_many :discussion_topics
  has_many :comments, as: :commentable

  accepts_nested_attributes_for :tags, :todos

  enum estimated_duration: [ :within_1_week, :within_1_month, :within_3_months ]

end
