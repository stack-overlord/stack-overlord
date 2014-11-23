class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter  :verify_authenticity_token

  def index
  	redirect_to "https://github.com/stack-overlord/stack_overlord-gem"
  end
end

