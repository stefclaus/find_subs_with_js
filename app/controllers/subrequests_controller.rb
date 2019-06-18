class SubrequestsController < ApplicationController

  before_action :require_logged_in

  def new
    @subrequest = Subrequest.new
  end

  def create
    @subrequest = Subrequest.create(subrequest_params)
    redirect_to assistant_path(@assistant)
  end

  def show
    @subrequest = Subrequest.find(params[:id])
  end

  def edit
    @subrequest = Subrequest.find(params[:id])
  end

  def index
    if params[:yogaclass_id]
      @subrequests = Yogaclass.find(params[:yogaclass_id]).subrequests
    else
      @subrequests = Subrequest.all
    end
  end

  def update
    @subrequest = Subrequest.find(params[:id])
    #render :edit
    redirect_to assistant_path(@assistant)
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
