# frozen_string_literal: true

module SessionManagerService
  class EndSession < ApplicationService

    def initialize(user_token:)
      @user_token = user_token
    end

    def call
      session = SessionManager::Session.find_by(
        token: @user_token
      )
      session.assign_attributes(
        last_seen: Time.now,
        logout_time: Time.now,
        archived: true
      )
      if session.save
        OpenStruct.new(success?: true, value: session, status_code: 200)
      else
        OpenStruct.new(success?: false, value: { error: session.errors }, status_code: 400)
      end
    end
  end
end
