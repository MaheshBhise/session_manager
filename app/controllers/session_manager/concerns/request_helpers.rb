require 'active_support/concern'

module SessionManager
  module RequestHelpers
    extend ActiveSupport::Concern

    included do
      # method to add to controller
      def track_session
        if cookies['user_token'].nil?
          create_new_session(current_user)
        else
          track_user_session(current_user, cookies['user_token'])
        end
      end
    end

    def create_new_session(user)
      return if user.nil?

      result = SessionManagerService::StartSession.call(
        user: user,
        user_agent: request.user_agent,
        ip_address: request.remote_ip
      )
      response.set_cookie(
        "user_token", { value: result.value.token, domain: request.domain, path: '/' }
      )
    end

    def track_user_session(user, user_token)
      if user.nil?
        SessionManagerService::EndSession.call(
          user_token: user_token
        )
        response.set_cookie("user_token", { value: '', domain: request.domain, path: '/', expires: Time.now })
      else
        SessionManagerService::TrackSession.call(
          user_token: user_token
        )
      end
    end
  end
end
