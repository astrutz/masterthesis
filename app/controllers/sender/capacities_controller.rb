# frozen_string_literal: true

module Sender
  class CapacitiesController < ApplicationController
    def index
      @recipient_address = params[:recipient]
      recipient = Recipient.find_by(email_address: @recipient_address)
      inbox = Inbox.find_by(recipient: recipient)
      @mails_count = Message.where(inbox: inbox).length
      @editing_performance = recipient.editing_performance_per_day
      @target_date = (@mails_count / @editing_performance + 1).to_f.ceil.days.from_now.to_date
    end
  end
end
