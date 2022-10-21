# frozen_string_literal: true

module Receive
  class SessionsController < ApplicationController
    def new; end

    def create
      recipient = Recipient.find_by(username: params[:username])
      if recipient&.authenticate(params[:password])
        session[:recipient_id] = recipient.id
        redirect_to receive_root_url
      else
        redirect_to receive_login_path(error: 'true')
      end
    end

    def destroy
      session[:recipient_id] = nil
      redirect_to root_url
    end
  end
end
