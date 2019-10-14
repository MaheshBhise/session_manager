module SessionManager
  class Session < ApplicationRecord
    validates :token, :email, :user_id, :user_agent, :ip_address, :login_time, :last_seen, presence: true
  end
end
