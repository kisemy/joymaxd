class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def assign_roles
    @user = User.find(params[:id])
  end

  def update_roles
    @user = User.find(params[:id])
    @user.role_ids = params[:user][:role_ids]
    redirect_to users_path, notice: 'Roles updated successfully.'
  end
end
