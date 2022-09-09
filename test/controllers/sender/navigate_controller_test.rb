# frozen_string_literal: true

require 'test_helper'

module Send
  class NavigateControllerTest < ActionDispatch::IntegrationTest
    test 'should redirect to capacities with given query param' do
      get '/send/navigate?commit=Aufkommen einsehen'
      assert_response :redirect
      assert_redirected_to '/send/capacity'
    end

    test 'should redirect to priorities with given query param' do
      get '/send/navigate?commit=E-Mail priorisieren'
      assert_response :redirect
      assert_redirected_to '/send/priority'
    end

    test 'should redirect to overview with wrong query param' do
      get '/send/navigate?commit=foobar'
      assert_response :redirect
      assert_redirected_to '/send'
    end

    test 'should redirect with recipient email' do
      get '/send/navigate?commit=Aufkommen einsehen&recipient=foobar'
      assert_response :redirect
      assert_redirected_to '/send/capacity?recipient=foobar'
    end
  end
end
