# frozen_string_literal: true

module Receive
  class RulesController < ApplicationController
    before_action :authorize

    def index
      @rules = current_user.inbox.rules
    end

    def new
      @rule = Rule.new
    end

    def create
      rule = Rule.new
      rule.field_to_search = params[:rule][:field_to_search]
      rule.field_matcher = params[:rule][:field_matcher]
      rule.inbox = current_user.inbox
      if rule.save
        redirect_to receive_rules_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @rule = Rule.find(params[:id])
    end

    def update
      @rule = Rule.find(params[:id])
      @rule.field_to_search = params[:rule][:field_to_search]
      @rule.field_matcher = params[:rule][:field_matcher]
      if @rule.save
        redirect_to receive_rules_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      rule = Rule.find(params[:id])
      rule.delete
      redirect_to receive_rules_path
    end
  end
end
