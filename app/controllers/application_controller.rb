# frozen_string_literal: true

class ApplicationController < ActionController::Base
  class NotAdminError < StandardError; end

  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  include SessionsHelper

  rescue_from ApplicationController::NotAdminError, with: :rescue403

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def rescue403
    render template: 'errors/forbidden', status: 403
  end
end
