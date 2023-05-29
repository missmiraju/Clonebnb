class MeetupsController < ApplicationController
  def new
    @meetup = Meetup.new
  end

  def create
    @meetup = Meetup.new(params[:meetup])
    if @meetup.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def meetup_params
    params.require(:meetup).permit(:date, :description)
  end
end
