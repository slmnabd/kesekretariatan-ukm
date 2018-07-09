class TypeOfMeetingsController < ApplicationController

  def index
    @type_of_meeting = TypeOfMeeting.all
  end

  def new
    @type_of_meeting = TypeOfMeeting.new
  end

  def create
    @type_of_meeting = TypeOfMeeting.new(resource_params)
    if @type_of_meeting.save
      redirect_to type_of_meetings_path
    else
      render 'new'
    end
  end

  def edit
    @type_of_meeting = TypeOfMeeting.find(params[:id])
  end


  def update
    @type_of_meeting = TypeOfMeeting.find(params[:id])
    @type_of_meeting.update(resource_params)
    redirect_to type_of_meetings_path(@type_of_meeting)
  end

  def destroy
    @type_of_meeting = TypeOfMeeting.find(params[:id])
    @type_of_meeting.destroy
    redirect_to type_of_meetings_path(@type_of_meeting)
  end



  private

  def resource_params
    params.require(:type_of_meeting).permit(:name)
  end

end
