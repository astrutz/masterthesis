# frozen_string_literal: true

class EmailLoadJob < ApplicationJob
  queue_as :default

  def perform(*_args, recipients: Recipient.all)
    puts 'Job started'
    recipients.each do |recipient|
      puts "Checking #{recipient.username}"
      credential = recipient.credential
      EmailServices.establish_connection(credential)
      messages = EmailServices.fetch_new_messages
      save_messages(messages)
    end
    puts 'Job finished'
  end

  def save_messages(messages)
    messages.each do |message|
      from = message.from.first
      to = message.to.first
      subject = message.subject
      send_at = message.date
      value_header = message.header['X-Pay2Mail-Priority']
      content = message.decoded
      duplicate = Message.find_by(sender_address: from, recipient_address: to, send_at: send_at)
      next if duplicate.present?

      puts 'New Message to save'
      recipient = Recipient.find_by(email_address: to)
      inbox = Inbox.find_by(recipient: recipient)
      message = Message.new(inbox: inbox, sender_address: from, recipient_address: to, subject: subject, send_at: send_at, content: content)
      message.value_header = value_header if value_header.present?
      message.save
    end
  end
end
