require 'test_helper'

module SessionManagerService
  class StartSessionTest < ActiveSupport::TestCase
    def setup
      @session = SessionManager::Session.new(
        user_id: 23,
        email: 'john@example.com',
        token: 'jhdfkhaskdfhksda',
        user_agent: 'Chrome',
        ip_address: '34.232.3.4',
        login_time: Time.now,
        logout_time: Time.now,
        last_seen: Time.now,
        archived: Time.now
      )
    end

    test "create a new session record" do
      result = SessionManagerService::StartSession.call(
        user: OpenStruct.new(user_id: 33, email: 'test@example.com'),
        user_agent: 'Chrome',
        user_ip: '23.223.3.3'
      )
      assert_not_nil result
    end
  end
end
