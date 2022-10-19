# frozen_string_literal: true

require 'test_helper'

class InboxTest < ActiveSupport::TestCase
  test 'should create inbox' do
    inbox = Inbox.new(recipient: recipients(:one))
    inbox.save
    assert_equal 6, Inbox.all.size
    assert_equal recipients(:one), Inbox.last.recipient
  end
end
