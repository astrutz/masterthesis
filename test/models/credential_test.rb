# frozen_string_literal: true

require 'test_helper'

class CredentialTest < ActiveSupport::TestCase
  test 'should create Credential' do
    credential = Credential.new(server: 'server', port: '', ssl: '', auth_type: '', username: '', password: 'pass', recipient: recipients(:one))
    credential.save
    assert_equal 3, Credential.all.size
    assert_equal 'server', Credential.last.server
  end
end
