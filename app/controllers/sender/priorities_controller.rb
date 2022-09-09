# frozen_string_literal: true

module Sender
  class PrioritiesController < ApplicationController
    def index
      @recipient = params[:recipient]
    end
  end
end
