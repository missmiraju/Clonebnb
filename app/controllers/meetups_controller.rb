class MeetupsController < ApplicationController
  def new
    @meetup = Meetup.new
  end

  def show
    @meetup = meetup.find(params[:id])
  end

  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.user = current_user
    if @meetup.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def meetup_params
    params.require(:meetup).permit(:date, :description, :title)
  end
end
