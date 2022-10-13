# frozen_string_literal: true

module Receive
  class InboxesController < ApplicationController
    before_action :authorize

    def show
      @inbox = Inbox.find(params[:id])
    end
  end
end
