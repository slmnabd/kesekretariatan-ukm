class TypeOfLettersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @type_of_letter = TypeOfLetter.all
  end

  def new
    @type_of_letter = TypeOfLetter.new
  end

  def create
    @type_of_letter = TypeOfLetter.new(resource_params)
    if @type_of_letter.save
      redirect_to type_of_letters_path
    else
      render 'new'
    end
  end

  def edit
    @type_of_letter = TypeOfLetter.find(params[:id])
  end


  def update
    @type_of_letter = TypeOfLetter.find(params[:id])
    @type_of_letter.update(resource_params)
    redirect_to type_of_letters_path(@type_of_meeting)
  end

  def destroy
    @type_of_letter = TypeOfLetter.find(params[:id])
    @type_of_letter.destroy
    redirect_to type_of_letters_path(@type_of_meeting)
  end



  private

  def resource_params
    params.require(:type_of_letter).permit(:name)
  end

end
