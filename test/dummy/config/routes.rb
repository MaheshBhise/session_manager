Rails.application.routes.draw do
  mount SessionManager::Engine => "/session_manager"
end
