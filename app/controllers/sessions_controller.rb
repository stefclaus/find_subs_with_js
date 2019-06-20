class SessionsController < ApplicationController
	require 'securerandom'

  def new
    @assistants = Assistant.all
  end

  def create
    @assistant = Assistant.find_by(email: params[:assistant][:email])

    if @assistant && @assistant.authenticate(params[:assistant][:password])
      session[:assistant_id] = @assistant.id
      redirect_to assistant_path(@assistant)
    else
      flash[:message] = "Sorry, please try again"
      redirect_to '/signin'
    @assistant = @assistant.try(:authenticate, params[:assistant][:password])
    end
  end


  def fbcreate
    @assistant = Assistant.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      u.password = SecureRandom.hex(15)
    end
    session[:assistant_id] = @assistant.id
    redirect_to assistant_path(@assistant)
  end



  def destroy
    session.clear
    redirect_to "/"
  end

private

  def auth
    request.env['omniauth.auth']
  end

end
