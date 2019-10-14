# frozen_string_literal: true

module SessionManagerService
  class StartSession < ApplicationService

    def initialize(user:, ip_address:, user_agent:)
      @user = user
      @ip_address = ip_address
      @user_agent = user_agent
    end

    def call
      session = SessionManager::Session.new(
        user_id: @user.id,
        email: @user.email,
        ip_address: @ip_address,
        user_agent: @user_agent,
        token: generate_uniq_token,
        login_time: Time.now,
        last_seen: Time.now
      )

      if session.save
        OpenStruct.new(success?: true, value: session, status_code: 200)
      else
        OpenStruct.new(success?: false, value: { error: session.errors }, status_code: 400)
      end
    end

    private

    def generate_uniq_token
      key = SecureRandom.random_bytes(32)
      crypt = ActiveSupport::MessageEncryptor.new(key)
      crypt.encrypt_and_sign("#{@user_id}-#{@user_agent}-#{@ip_address}")
    end
  end
end
