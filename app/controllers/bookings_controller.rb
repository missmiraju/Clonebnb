MONTHS = %w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec]

class BookingsController < ApplicationController
  # def show
  #   # raise
  #   # @meetup = Meetup.find(params[:id])
  #   # authorize @meetup
  # end

  def new
    @booking = Booking.new
    authorize @booking
    @meetup = Meetup.find(params[:meetup_id])
    @months = MONTHS
    @current_year = Date.today.year.to_i
  end

  def create
    @meetup = Meetup.find(params[:booking][:meetup_id])
    @booking = Booking.new(bookings_params)
    @booking.accepted = false
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  # def destroy
  # end

  # def edit
  # end

  def update
    @booking = Booking.find(params[:id])
    @booking.accepted = !@booking.accepted
    authorize @booking

    if @booking.save
      redirect_to booking_path(@booking.meetup), notice: "Booking updated successfully."
    else
      render :edit
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:meetup_id, :accepted)
  end
end
