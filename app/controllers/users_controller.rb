MONTHS = %w[Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec]

class UsersController < ApplicationController
  def index
    @months = MONTHS
    @current_year = Date.today.year.to_i

    # @users_with = User.all
    @users_with = policy_scope(User).joins(:meetups).distinct

    # raise
    if params[:search].present?
      sql_subquery = <<~SQL
        meetups.title ILIKE :query
        OR meetups.description ILIKE :query
        OR users.username ILIKE :query
        OR users.first_name ILIKE :query
        OR users.last_name ILIKE :query
        OR users.description ILIKE :query
      SQL
      @users_with = @users_with.joins(:meetups).where(sql_subquery, query: "%#{params[:search]}%")
      # .join(:tags)
      # OR tags.title ILIKE :query
      end

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
