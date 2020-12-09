class CampaignPolicy < ApplicationPolicy
  attr_reader :user, :campaign

  def initialize(user, campaign)
    @user = user
    @campaign = campaign
  end

  def create?
    user.instance_of?(Expert)
  end
end
