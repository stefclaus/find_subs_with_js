class SessionsController < ApplicationController

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
  #  @assistant = @assistant.try(:authenticate, params[:assistant][:password])
#    return redirect_to root_path unless @assistant
    end
  end




  def destroy
    session.clear
    redirect_to "/"
  end


end
