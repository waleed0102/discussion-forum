class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @parent  = parent
    @comment = @parent.comments.new(title: params[:title])
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        if params[:discussion_topic_id]
          format.html { redirect_to "/campaigns/#{params[:campaign]}/discussion_topics/#{params[:discussion_topic_id]}", notice: 'Comment Added successfully' }
        else
          format.html { redirect_to "/campaigns/#{params[:campaign_id]}", notice: 'Comment Added successfully' }
        end
      else
        format.html { render action: "new" }
      end
    end
   end

   private

   def parent
      return Campaign.find params[:campaign_id] if params[:campaign_id]
      DiscussionTopic.find params[:discussion_topic_id] if params[:discussion_topic_id]
   end
end
