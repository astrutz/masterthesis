# frozen_string_literal: true

module Receive
  class MessagesController < ApplicationController
    before_action :authorize

    def show
      @message = Message.find(params[:id])
      @processable = (params[:due].present? && params[:due] == I18n.l(Time.now.to_date))
    end

    def destroy
      message = Message.find(params[:id])
      if params[:fetch].nil?
        EmailServices.establish_connection(current_user.credential)
        EmailServices.read_message(message)
      end
      message.processed_at = params[:ruled] == 'true' ? Time.zone.parse('1900-01-01 00:00') : Time.now
      message.save
      redirect_to receive_root_path
    end
  end
end
