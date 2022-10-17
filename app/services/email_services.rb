# frozen_string_literal: true

class EmailServices
  def self.establish_connection(credential)
    Mail.defaults do
      retriever_method :imap, address: credential.server,
                              port: credential.port,
                              user_name: credential.username,
                              password: credential.password,
                              enable_ssl: true
    end
  end

  def self.fetch_new_messages
    Mail.find(keys: %w[NOT SEEN], read_only: true)
  end

  def self.read_message(message)
    send_at_localized = I18n.l(message.send_at, format: '%d-%b-%Y', locale: :en)
    mails_on_date = Mail.find(keys: ['FROM', message.sender_address, 'ON', send_at_localized], read_only: true)
    mail_to_read = mails_on_date.find { |element| element.date == message.send_at }
    Mail.find(keys: ['HEADER', 'Message-ID', mail_to_read.message_id])
  end
end
