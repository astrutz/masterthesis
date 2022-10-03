# frozen_string_literal: true

require 'test_helper'

class RecipientTest < ActiveSupport::TestCase
  test 'should create recipient' do
    recipient = Recipient.new(name: '', email_address: '', username: '', password: '', editing_performance_per_day: 1, inbox: inboxes(:one))
    recipient.save
    assert true
  end
end
