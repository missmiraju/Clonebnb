MONTHS = %w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec]

class UsersController < ApplicationController
  def index
    @months = MONTHS
    @current_year = Date.today.year.to_i

    @users_with = User.all
    @users_with = policy_scope(User).reject { |user| user.meetups.first.nil? }
    @num_tags = 3 # define how many tags should be displayed on the initial page
  end

  def show
    @months = MONTHS
    @current_year = Date.today.year.to_i
    
    @user = User.find(params[:id])
    authorize @user
    @meetups = @user.meetups
    @utags = @user.user_tags
    @bookings = @user.bookings
  end
end
