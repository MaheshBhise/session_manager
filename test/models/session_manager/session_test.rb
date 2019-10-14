require 'test_helper'

module SessionManager
  class SessionTest < ActiveSupport::TestCase
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

    test 'valid session' do
      assert @session.valid?
    end

    %w[user_id email token user_agent ip_address login_time last_seen].each do |field|
      test "invalid without #{field}" do
        @session.send("#{field}=", nil)

        refute @session.valid?
        assert_not_nil @session.errors[field.to_sym]
      end
    end
  end
end
