class DiscussionTopic < ApplicationRecord
  belongs_to :campaign
  has_many :comments, as: :commentable
  belongs_to :novice, class_name: "User", foreign_key: 'user_id'

  validate :ensure_discussion_topic_per_expert, on: :create

  private
    def ensure_discussion_topic_per_expert
      existing_campaigns_ids = campaign.expert.campaigns.ids - [campaign.id]
      if DiscussionTopic.where(user_id: self.user_id, campaign_id: existing_campaigns_ids).any?
        errors.add(:discussion_topic, 'discussion topic cannot be created for this expert')
      end
    end
end
