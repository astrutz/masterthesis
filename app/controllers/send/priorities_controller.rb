# frozen_string_literal: true

module Send
  class PrioritiesController < ApplicationController
    before_action :fetch_recipient

    def index
      if @recipient.present?
        inbox = Inbox.find_by(recipient: @recipient)
        messages_due_today = @recipient.editing_performance_per_day - inbox.messages.where(processed_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).size
        @messages_sorted = Message.unprocessed.where(inbox: inbox).with_value(sorted: true)
        @due_dates = DueDateServices.due_dates(inbox, messages_due_today)
      else
        render 'send/static/404'
      end
    end

    def create
      form_data = params[:value]
      value = Value.new
      value.sender_address = form_data[:sender_address]
      value.recipient_address = form_data[:recipient_address]
      value.amount = form_data[:amount]
      value.save
      redirect_to send_priority_path(value.uuid, target: value.target_date)
    end

    def show
      @uuid = params[:id]
    end

    def fetch_recipient
      recipient_address = params[:recipient]
      @recipient = Recipient.find_by(email_address: recipient_address)
      EmailLoadJob.perform_now(recipients: [@recipient]) if @recipient.present? && params[:fetch].nil?
    end
  end
end
