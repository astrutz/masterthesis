# frozen_string_literal: true

module Receive
  class MessagesController < ApplicationController
    before_action :authorize

    def show
      @message = Message.find(params[:id])
    end
  end
end
