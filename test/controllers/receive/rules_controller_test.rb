# frozen_string_literal: true

require 'test_helper'

module Receive
  class RulesControllerTest < ActionDispatch::IntegrationTest
    test 'should get /receive/rules' do
      post '/receive/sessions', params: { username: recipients(:one).username, password: default_password }
      get '/receive/rules'
      assert_response :success
    end

    test 'should get /receive/rule' do
      post '/receive/sessions', params: { username: recipients(:one).username, password: default_password }
      get "/receive/rules/#{rules(:one).id}/edit"
      assert_response :success
    end

    test 'should update rule' do
      assert_equal 'sub_one', Rule.find(rules(:one).id).field_matcher
      assert_equal 'subject', Rule.find(rules(:one).id).field_to_search
      post '/receive/sessions', params: { username: recipients(:one).username, password: default_password }
      patch "/receive/rules/#{rules(:one).id}", params: { rule: { field_matcher: 'foo', field_to_search: 'bar' } }
      assert_response :redirect
      assert_redirected_to '/receive/rules'
      assert_equal 'foo', Rule.find(rules(:one).id).field_matcher
      assert_equal 'bar', Rule.find(rules(:one).id).field_to_search
    end

    test 'should create rule' do
      assert_equal 2, Rule.all.size
      assert_equal 'sub_one', Rule.last.field_matcher
      post '/receive/sessions', params: { username: recipients(:one).username, password: default_password }
      post '/receive/rules', params: { rule: { field_matcher: 'foo', field_to_search: 'bar' } }
      assert_response :redirect
      assert_redirected_to '/receive/rules'
      assert_equal 3, Rule.all.size
      assert_equal 'foo', Rule.last.field_matcher
    end

    test 'should delete rule' do
      post '/receive/sessions', params: { username: recipients(:one).username, password: default_password }
      assert_not_empty Rule.where(id: rules(:one).id)
      get "/receive/rule/#{rules(:one).id}/delete"
      assert_response :redirect
      assert_redirected_to '/receive/rules'
      assert_empty Rule.where(id: rules(:one).id)
    end
  end
end
