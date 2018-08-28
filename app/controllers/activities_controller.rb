class ActivitiesController < ApplicationController

  before_action :authenticate_admin!, only: [:new, :create]
  def index
    if params[:search]
      @activity = Activity.where('name like ?', "%#{params[:search]}%")
    else
      @activity = Activity.order(id: :asc)
    end
  end

  def show
    @activity = Activity.find(params[:id])
    @letter = Letter.all
    @meeting_result = MeetingResult.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(resource_params)
    if @activity.save
      redirect_to activities_path
    else
      render 'new'
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end


  def update
    @activity = Activity.find(params[:id])
    @activity.update(resource_params)
    redirect_to activities_path(@activity)
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to activities_path(@activity)
  end



  private

  def resource_params
    params.require(:activity).permit(:name, :description, :date)
  end
end
