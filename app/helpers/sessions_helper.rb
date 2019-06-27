# frozen_string_literal: true

module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
  # rubocop:disable all
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    end
  # rubocop:enable all
  end

  def route_by_logged_in
    redirect_to login_url unless logged_in?
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
