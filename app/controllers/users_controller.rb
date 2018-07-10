class UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  # def show
  #   @user = User.find(params[:id])
  # end

  def create
    @user = User.new(resume_params)
    if @user.save
      redirect_to users_path
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(resource_params)
    redirect_to users_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path(@user)
  end

private
  def resume_params
    params.require(:user).permit(:name, :nim, :phone, :email)
  end
end