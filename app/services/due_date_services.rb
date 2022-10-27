# frozen_string_literal: true

class DueDateServices
  def self.due_dates(inbox, messages_due_today)
    due_dates = []
    due_date = DateTime.current.to_date
    inbox.messages.unprocessed.with_value(sorted: true).each_with_index do |_message, index|
      due_date += 1.day if ((index + messages_due_today) % inbox.recipient.editing_performance_per_day).zero? && index >= messages_due_today
      due_dates << due_date
    end
    due_dates
  end
end
