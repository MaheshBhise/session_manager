require 'test_helper'

module SessionManagerService
  class TrackSessionTest < ActiveSupport::TestCase
    def setup
      @session = SessionManagerService::StartSession.call(
        user: OpenStruct.new(id: 33, email: 'test@example.com'),
        user_agent: 'Chrome',
        ip_address: '23.223.3.3'
      )
    end

    test "track and update session record" do
      result = SessionManagerService::TrackSession.call(
        user_token: @session.value.token
      )
      assert_not_equal result.value.last_seen, @session.value.last_seen
    end
  end
end
