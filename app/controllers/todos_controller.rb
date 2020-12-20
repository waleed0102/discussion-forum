class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_campaign
  
  def create
    @todo = @campaign.todos.new(title: params[:title])

    respond_to do |format|
      if @todo.save
        format.html { redirect_to campaign_path(@campaign), notice: 'Todo Added successfully' }
      else
        format.html { redirect_to campaign_path(@campaign), alert: "#{@todo.errors.full_messages.join(', ')}" }
      end
    end
   end

   private

   def set_campaign
    @campaign = Campaign.find params[:campaign_id]
   end
end
