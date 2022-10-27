# frozen_string_literal: true

module Send
  class CapacitiesController < ApplicationController
    before_action :fetch_recipient

    def index
      if @recipient.present?
        inbox = Inbox.find_by(recipient: @recipient)
        @mails_count = Message.unprocessed.where(inbox: inbox).length
        @editing_performance = @recipient.editing_performance_per_day
        messages_due_today = @recipient.editing_performance_per_day - inbox.messages.where(processed_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).size
        due_dates = DueDateServices.due_dates(inbox, messages_due_today)
        @target_date = due_dates[-1] += 1
      else
        render 'send/static/404', status: 404
      end
    end

    def fetch_recipient
      recipient_address = params[:recipient]
      @recipient = Recipient.find_by(email_address: recipient_address)
      EmailLoadJob.perform_now(recipients: [@recipient]) if @recipient.present? && params[:fetch].nil?
    end
  end
end
