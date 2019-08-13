class SubrequestsController < ApplicationController

  before_action :require_logged_in

  def index
    if params[:yogaclass_id]
      @subrequests = Yogaclass.find(params[:yogaclass_id]).subrequests.all.created_before(params[:date])
    else
      @subrequests = Subrequest.all.created_before(params[:date])
    end
  end


  def new
    @subrequest = Subrequest.new
  end

  def create
    current_assistant.subrequests.build(subrequest_params).save
      respond_to do |format|
        format.html {redirect_to assistant_path(@assistant)}
  #  @subrequest = Subrequest.build(subrequest_params)
        format.json { render json: @subrequest}
      end
  end

  def show
    @subrequest = Subrequest.find(params[:id])
  end

  def edit
    @subrequest = Subrequest.find(params[:id])
  end



  def update
    @subrequest = Subrequest.find(params[:id])
    @subrequest.update(subrequest_params)
    respond_to do |format|
      format.html {redirect_to subrequest_path(@subrequest)}
      format.json {render json: @subrequest}
    end


    #render :edit
  #  redirect_to assistant_path(@assistant)
  end


	def destroy
	#	find_reported_issue
	#		@reported_issue.destroy
	#		redirect_to reported_issues_path
	end

  private

  def subrequest_params
    params.require(:subrequest).permit(:comment, :date, :assistant_requesting, :assistant_covering, :assistant_id, :yogaclass_id)
  end

end
