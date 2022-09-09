# frozen_string_literal: true

module Sender
  class CapacitiesController < ApplicationController
    def index
      @recipient = params[:recipient]
      @mails = rand(150)
      @performance = rand(1..15)
    end
  end
end
