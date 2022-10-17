# frozen_string_literal: true

module Receive
  class MessagesController < ApplicationController
    before_action :authorize

    def show
      @message = Message.find(params[:id])
    end

    def destroy
      message = Message.find(params[:id])
      EmailServices.establish_connection(current_user.credential)
      EmailServices.read_message(message)
      message.delete
      # TODO: bearbeitungsleistung des tages entsprechend anpassen (später) falls nicht special mail
      redirect_to receive_root_path
    end
  end
end
