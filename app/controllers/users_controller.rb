class UsersController < ApplicationController
  def index
    @users = User.all
    @users = policy_scope(User)
    @num_tags = 3 # define how many tags should be displayed on the initial page
  end
end
