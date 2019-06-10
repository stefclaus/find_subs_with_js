class SessionsController < ApplicationController

  def new
    @assistants = Assistant.all
  end

  def create
    @assistant = Assistant.find_by(name: params[:assistant][:name])
    @assistant = @assistant.try(:authenticate, params[:assistant][:password])
    return redirect_to root_path unless @assistant
    session[:assistant_id] = @assistant.id
    redirect_to assistant_path(@assistant)
  end



  def destroy
    session.clear
    redirect_to "/"
  end


end
