class CampaignsController < ApplicationController
  before_action :authenticate_user!

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user_id = current_user.id
    authorize @campaign

    respond_to do |format|
      if @campaign.save
        format.json { render json: @campaign, status: :created}
      else
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title, :purpose, :estimated_duration)
  end
end
