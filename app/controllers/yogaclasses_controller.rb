class YogaclassesController < ApplicationController
  before_action :require_logged_in

  def index
    @yogaclasses = Yogaclass.all

  end

  def show
    @yogaclass = Yogaclass.find(params[:id])
   #@ride = @attraction.rides.build(user_id:current_user.id)
  end

  def instructor
    yogaclass = Yogaclass.find(params[:id])
    render plain: yogaclass.instructor
  end

  def time
    yogaclass = Yogaclass.find(params[:id])
    render plain: yogaclass.time
  end

  def weekday
    yogaclass = Yogaclass.find(params[:id])
    render plain: yogaclass.weekday
  end

  def subrequest
    @yogaclass = Yogaclass.find(params[:id])
    @subrequest = Subrequest.find(params[:subrequest_id])
    render template: 'subrequests/show'
  end


end
