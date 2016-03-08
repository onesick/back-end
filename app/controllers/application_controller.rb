class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # TODO for now checking sessions are disabled to easily check API function. After implementation of authroization, change it
  protect_from_forgery with: :null_session
end
