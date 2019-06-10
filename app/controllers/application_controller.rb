class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_assistant

 def current_assistant
   @assistant = (Assistant.find_by(id: session[:user_id]) || Assistant.new)
 end

 def logged_in?
   current_assistant.id != nil
 end

 def require_logged_in
   if logged_in?
   else
     redirect_to(controller: 'sessions', action: 'new')
   end
 end

end
