# frozen_string_literal: true

module Receive
  class InboxesController < ApplicationController
    before_action :authorize

    def show
      @inbox = params[:id].present? ? Inbox.find(params[:id]) : Inbox.find_by(recipient: current_user)
      EmailLoadJob.perform_now(recipients: [@inbox.recipient]) if params[:fetch].nil?
    end
  end
end
