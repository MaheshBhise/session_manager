require 'test_helper'

module SessionManagerService
  class EndSessionTest < ActiveSupport::TestCase
    def setup
      @session = SessionManagerService::StartSession.call(
        user: OpenStruct.new(id: 33, email: 'test@example.com'),
        user_agent: 'Chrome',
        ip_address: '23.223.3.3'
      )
    end

    test "record logout time and archive the record" do
      result = SessionManagerService::EndSession.call(
        user_token: @session.value.token
      )
      assert_not_nil result.value.last_seen
      assert_not_nil result.value.logout_time
      assert_equal true, result.value.archived
    end
  end
end
