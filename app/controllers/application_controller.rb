class ApplicationController < ActionController::Base
  before_action :authenticate_user! # has to be logged in
  include Pundit::Authorization

  # @oli: past me here: you may need to change the following two lines
  # later on if the pages where the authorisation is incorrect
  # and/or move them to a different file
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :username, :name, :description, :first_name, :last_name, :photo])
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
