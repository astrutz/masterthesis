# frozen_string_literal: true

module Receive
  class InboxesController < ApplicationController
    before_action :authorize

    def show
      @inbox = params[:id].present? ? Inbox.find(params[:id]) : Inbox.find_by(recipient: current_user)
      @messages_due_today = @inbox.recipient.editing_performance_per_day - @inbox.messages.where(processed_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).size
      EmailLoadJob.perform_now(recipients: [@inbox.recipient]) if params[:fetch].nil?
    end
  end
end
