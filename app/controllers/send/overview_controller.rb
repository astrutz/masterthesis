# frozen_string_literal: true

module Send
  class OverviewController < ApplicationController
    def index
      @recipient_address = params[:recipient]
    end
  end
end
