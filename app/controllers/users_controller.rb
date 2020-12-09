class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def update
    @user = User.find params[:id]
    authorize @user, policy_class: UserPolicy

    respond_to do |format|
      if @user.update(user_params)
        format.json { render json: @user, status: :created}
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:status)
  end
end
