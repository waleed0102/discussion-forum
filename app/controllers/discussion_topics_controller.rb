class DiscussionTopicsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @discussion_topic = DiscussionTopic.new
    @campaign_id = params[:campaign_id]
  end

  def show
    @discussion_topic = DiscussionTopic.find(params[:id])
  end

  def create
    @discussion_topic = DiscussionTopic.new(discussion_topic_params)
    @discussion_topic.user_id = current_user.id
    authorize @discussion_topic

    respond_to do |format|
      if @discussion_topic.save
        format.html { redirect_to "/campaigns/#{params[:campaign_id]}", notice: 'Comment Added successfully' }
      else
        format.html { render action: "new" }
      end
    end
  end

  private

  def discussion_topic_params
    params.require(:discussion_topic).permit(:title, :campaign_id)
  end
end


