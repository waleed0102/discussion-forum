class DiscussionTopicPolicy < ApplicationPolicy
  attr_reader :user, :discussion_topic

  def initialize(user, discussion_topic)
    @user = user
    @discussion_topic = discussion_topic
  end

  def create?
    user.instance_of?(Novice) && user.status == 'qualified'
  end
end
