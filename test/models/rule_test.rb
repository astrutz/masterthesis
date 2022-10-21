# frozen_string_literal: true

require 'test_helper'

class RuleTest < ActiveSupport::TestCase
  test 'should create rule' do
    rule = Rule.new(inbox: inboxes(:one), field_to_search: '', field_matcher: '')
    rule.save
    assert_equal 3, Rule.all.size
    assert_equal inboxes(:one), Rule.last.inbox
  end
end
