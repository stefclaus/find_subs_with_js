class AssistantsController < ApplicationController

  def new
    @assistant = Assistant.new
  end



  def create
    @assistant = Assistant.create(assistant_params)

    if @assistant.save
      session[:assistant_id] = @assistant.id
      redirect_to assistant_path(@assistant)
    else
      flash[:message] = "Sorry, please try again. You must enter a password, username, and email."
      redirect_to root_path
    end
  end

  def show
    if !logged_in?
      redirect_to "/"
    else
      @assistant = Assistant.find_by(id:params[:id])
      #put something in here thaat will give this an instance of a subrequest to display
      #@subrequests = Assistant.find_by(id:params[:id]).subrequests
      @subrequests = @assistant.subrequests.all.created_before(params[:date])
      @yourshifts = []

      @subrequests.each do |subrequest|
        if subrequest.assistant_covering == @assistant.name
          @yourshifts << subrequest
        end
      end

    end
	end



  private

  def assistant_params
    params.require(:assistant).permit(:name, :email, :password)
  end


end
