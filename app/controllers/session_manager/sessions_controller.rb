module SessionManager
  class SessionsController < ApplicationController
    def index
      @sessions = SessionManager::Session
        .order(last_seen: :desc)
        .page(params[:page])
        .per(10)
    end
  end
end
