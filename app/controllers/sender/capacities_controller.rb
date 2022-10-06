# frozen_string_literal: true

module Sender
  class CapacitiesController < ApplicationController
    before_action :fetch_recipient

    def index
      if @recipient.present?
        inbox = Inbox.find_by(recipient: @recipient)
        @mails_count = Message.where(inbox: inbox).length
        @editing_performance = @recipient.editing_performance_per_day
        @target_date = (@mails_count / @editing_performance + 1).to_f.ceil.days.from_now.to_date
      else
        render 'sender/static/404', status: 404
      end
    end

    def fetch_recipient
      recipient_address = params[:recipient]
      @recipient = Recipient.find_by(email_address: recipient_address)
      EmailLoadJob.perform_now(recipients: [@recipient]) if @recipient.present? && params[:fetch].nil?
    end
  end
end
