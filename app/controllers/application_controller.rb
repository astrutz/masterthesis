# frozen_string_literal: true

class ApplicationController < ActionController::Base
  I18n.locale = :de
  http_basic_authenticate_with name: ENV['BASIC_USER'], password: ENV['BASIC_PASSWORD'] if ENV['BASIC_USER'].present?

  private

  def current_user
    @recipient ||= Recipient.find(session[:recipient_id]) if session[:recipient_id]
  end
  helper_method :current_user

  def authorize
    redirect_to receive_login_url, alert: 'Not authorized' if current_user.nil?
  end
end
