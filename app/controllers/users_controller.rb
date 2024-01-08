class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])

    unless @user
      flash[:error] = "User not found"
      redirect_to root_path
    end
  end
end
