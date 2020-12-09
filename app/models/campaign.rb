class Campaign < ApplicationRecord
  belongs_to :expert, class_name: "User"

  has_many :todos
  has_many :discussion_topics
  has_many :comments, as: :commentable

  enum estimated_duration: { within_1_week: 0, within_1_month: 1, within_3_months: 2 }

end
