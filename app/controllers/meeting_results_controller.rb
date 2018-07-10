class MeetingResultsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @meeting_result = MeetingResult.all
  end

  def new
    @meeting_result = MeetingResult.new
  end

  def show
    id = params[:id]
    @meeting_result = MeetingResult.find(id)
  end

  def create
    @meeting_result = MeetingResult.new(resource_params)
    
    if @meeting_result.save
      redirect_to meeting_results_path
    else
      render 'new'
    end
  end

  def edit
    @meeting_result = MeetingResult.find(params[:id])
  end


  def update
    @meeting_result = MeetingResult.find(params[:id])
    @meeting_result.update(resource_params)
    redirect_to meeting_results_path(@lecturer)
  end

  def destroy
    @meeting_result = MeetingResult.find(params[:id])
    @meeting_result.destroy
    redirect_to meeting_results_path(@lecturer)
  end



  private

  def resource_params
    params.require(:meeting_result).permit(:type_of_meeting_id, :date, :activity_id, :result)
  end

end
