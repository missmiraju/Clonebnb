MONTHS = %w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec]

class UsersController < ApplicationController
  def index
    @users = User.all
    # @users = User.all.reject{ |user| user.meetups.empty? }
    @users = policy_scope(User)
    @num_tags = 3 # define how many tags should be displayed on the initial page
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @meetups = @user.meetups
    @months = MONTHS
    @current_year = Date.today.year.to_i
    @utags = @user.user_tags
  end
end
