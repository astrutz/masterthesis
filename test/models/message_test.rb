# frozen_string_literal: true

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test 'should create message' do
    message = Message.new(inbox: inboxes(:one), sender_address: '', recipient_address: '', subject: '', send_at: Time.now, content: '')
    message.save
    assert true
  end
end
