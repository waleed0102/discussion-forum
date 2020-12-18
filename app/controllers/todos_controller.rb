class TodosController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @parent  = parent
    @todo = @parent.todos.new(title: params[:title])

    respond_to do |format|
      if @todo.save
        format.html { redirect_to "/campaigns/#{params[:campaign_id]}", notice: 'Todo Added successfully' }
      else
        format.html { render action: "new" }
      end
    end
   end

   private

   def parent
    return Campaign.find params[:campaign_id] if params[:campaign_id]
   end
end
