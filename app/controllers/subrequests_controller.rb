class SubrequestsController < ApplicationController

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

  def index
    @subrequests = Subrequest.all
  end


  private

  def subrequest_params
    params.require(:subrequest).permit(:comment, :date, :assistant_requesting, :assistant_covering, :assistant_id, :yogaclass_id)
  end

end
