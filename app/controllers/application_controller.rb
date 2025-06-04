class ApplicationController < ActionController::Base
  before_action :debug_user_state
  include Pundit
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  private
  
  def debug_user_state
    Rails.logger.info "Current user: #{current_user.inspect}"
    Rails.logger.info "User signed in?: #{user_signed_in?}"
    Rails.logger.info "Session: #{session.inspect}"
  end
end
