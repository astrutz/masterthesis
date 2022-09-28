# frozen_string_literal: true

class EmailLoadJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    puts 'Job started'
    Recipient.all.each do |recipient|
      puts "Checking #{recipient.username}"
      credential = recipient.credential
      establish_connection(credential)
      messages = fetch_new_messages
      save_messages(messages)
    end
    puts 'Job finished'
  end

  def establish_connection(credential)
    Mail.defaults do
      retriever_method :imap, address: credential.server,
                              port: credential.port,
                              user_name: credential.username,
                              password: credential.password,
                              enable_ssl: true
    end
  end

  def fetch_new_messages
    Mail.find(keys: %w[NOT SEEN], read_only: true)
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
      puts value_header # todo
      # message.value = value_header if value_header.present? todo: change db schema first
      message.save
    end
  end
end
