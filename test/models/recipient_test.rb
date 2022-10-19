# frozen_string_literal: true

require 'test_helper'

class RecipientTest < ActiveSupport::TestCase
  test 'should create recipient' do
    recipient = Recipient.new(name: '', email_address: 'mail', username: 'user', password: 'pass', editing_performance_per_day: 2, inbox: inboxes(:one))
    recipient.save!
    assert_equal 6, Recipient.all.size
    assert_equal 'mail', Recipient.last.email_address
  end
end
