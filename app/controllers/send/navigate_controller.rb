# frozen_string_literal: true

module Send
  class NavigateController < ApplicationController
    def index
      case params[:commit]
      when 'E-Mail priorisieren'
        redirect_to controller: :priorities, action: 'index', recipient: params[:recipient]
      when 'Aufkommen einsehen'
        redirect_to controller: :capacities, action: 'index', recipient: params[:recipient]
      else
        redirect_to controller: :overview, action: 'index', recipient: params[:recipient]
      end
    end
  end
end
