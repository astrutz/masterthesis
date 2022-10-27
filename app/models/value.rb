# frozen_string_literal: true

class Value < ApplicationRecord
  before_save :generate_uuid

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end

  def target_date
    recipient = Recipient.find_by(email_address: recipient_address)
    inbox = recipient.inbox
    messages_due_today = recipient.editing_performance_per_day - inbox.messages.where(processed_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).size
    due_dates = DueDateServices.due_dates(recipient.inbox, messages_due_today)
    due_dates[-1] += 1
  end
end
