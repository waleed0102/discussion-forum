class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @parent  = parent
    @comment = @parent.comments.new(title: params[:title])
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        if @discussion_topic
          format.html { redirect_to campaign_discussion_topic_path(@campaign, @discussion_topic), notice: 'Comment Added successfully' }
        else
          format.html { redirect_to campaign_path(@campaign), notice: 'Comment Added successfully' }
        end
      else
        format.html { redirect_to campaign_path(@campaign), alert: "#{@comment.errors.full_messages.join(', ')}" }
      end
    end
   end

   private

   def parent
      @campaign = Campaign.find params[:campaign_id]
      @discussion_topic = DiscussionTopic.find params[:discussion_topic_id] if params[:discussion_topic_id]
      return @discussion_topic if @discussion_topic
      @campaign
   end
end
