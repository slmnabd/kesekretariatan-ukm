class LettersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @letter = Letter.all
  end

  def new
    @letter = Letter.new
  end

  def show
    @letter = Letter.find(params[:id])
  end

  def create
    @letter = Letter.new(resume_params)
    if @letter.save
      redirect_to letters_path
    else
      render "new"
    end
  end

  def edit
    @letter = Letter.find(params[:id])
  end

  def update
    @letter = Letter.find(params[:id])
    @letter.update(resource_params)
    redirect_to letters_path(@letter)
  end

  def destroy
    @letter = Letter.find(params[:id])
    @letter.destroy
    redirect_to letters_path(@letter)
  end

private
  def resume_params
    params.require(:letter).permit(:activity_id, :type_of_letter_id, :description, :file)
  end
end