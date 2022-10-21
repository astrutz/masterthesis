# frozen_string_literal: true

module Receive
  module RulesHelper
    def translate_field_to_search(value)
      case value
      when 'subject'
        'Betreff'
      when 'sender_address'
        'Adresse des Absenders'
      when 'content'
        'Inhalt der E-Mail'
      else
        ''
      end
    end
  end
end
