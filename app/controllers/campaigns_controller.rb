class CampaignsController < ApplicationController
  before_action :authenticate_user!

  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user_id = current_user.id
    authorize @campaign

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to campaigns_path, notice: 'Post was successfully created.' }
      else
        format.html { render 'new', alert: "#{@campaign.errors.full_messages.join(', ')}" }
      end
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title, :purpose, :estimated_duration, todos_attributes: [:title], tags_attributes: [:name, :parent_id])
  end
end
