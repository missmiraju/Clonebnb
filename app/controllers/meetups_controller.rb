class MeetupsController < ApplicationController
  def new
    @meetup = Meetup.new
  end

  def show
    @meetup = Meetup.find(params[:id])
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

  def edit
    @meetup = Meetup.find(params[:id])
  end

  def update
    @meetup = Meetup.find(params[:id])

    if @meetup.update(meetup_params)
      redirect_to meetup_path(@meetup), notice: "Meetup updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @meetup = Meetup.find(params[:id])
    @meetup.destroy
    redirect_to meetups_path, notice: "Meetup deleted successfully."
  end

  private

  def meetup_params
    params.require(:meetup).permit(:date, :description, :title)
  end
end
