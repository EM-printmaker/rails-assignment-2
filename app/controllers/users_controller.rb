class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :profile_edit, :update]
  before_action :is_matching_login_user, only: [:show, :edit, :update]

  def index
    @user = current_user
    render "show"
  end

  def show
    @user = current_user
  end

  def profile_edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(profile_params)
      render "show"
    else
      render "profile_edit"
    end
  end

  private
  def profile_params
    params.require(:user).permit(:name, :avatar, :self_introduction)
  end

  def is_matching_login_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end
