class DiscussionTopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_campaign

  def new
    @discussion_topic = @campaign.discussion_topics.new
  end

  def show
    @discussion_topic = DiscussionTopic.find(params[:id])
  end

  def create
    @discussion_topic = @campaign.discussion_topics.new(discussion_topic_params)
    @discussion_topic.user_id = current_user.id
    authorize @discussion_topic

    respond_to do |format|
      if @discussion_topic.save
        format.html { redirect_to campaign_path(@campaign), notice: 'Comment Added successfully' }
      else
        format.html { redirect_to campaign_path(@campaign), alert: "#{@discussion_topic.errors.full_messages.join(', ')}" }
      end
    end
  end

  private

  def set_campaign
    @campaign = Campaign.find params[:campaign_id]
  end

  def discussion_topic_params
    params.require(:discussion_topic).permit(:title)
  end
end


