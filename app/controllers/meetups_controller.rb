class MeetupsController < ApplicationController
  def new
    @meetup = Meetup.new
    authorize @meetup
  end

  def index
    @users = User.all
    @meetups = if params[:search]
                 Meetup.where("title LIKE ? OR description ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
               else
                 Meetup.all
               end
  end

  def show
    @meetup = Meetup.find(params[:id])
    authorize @meetup
    @bookings = @meetup.bookings
  end

  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.user = current_user
    authorize @meetup
    if @meetup.save
      redirect_to meetup_path(@meetup)
    else
      render :new
    end
  end

  def edit
    @meetup = Meetup.find(params[:id])
    authorize @meetup
  end

  def update
    @meetup = Meetup.find(params[:id])
    authorize @meetup

    if @meetup.update(meetup_params)
      redirect_to meetup_path(@meetup), notice: "Meetup updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @meetup = Meetup.find(params[:id])
    authorize @meetup
    @meetup.destroy
    redirect_to root_path, notice: "Meetup deleted successfully."
  end

  private

  def meetup_params
    params.require(:meetup).permit(:date, :description, :title)
  end
end
