class YogaclassesController < ApplicationController
  before_action :require_logged_in

  def index
    @yogaclasses = Yogaclass.all
      respond_to do |format|
        format.html
        format.json { render json: @yogaclasses }
      end

  end

  def show
    @yogaclass = Yogaclass.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @yogaclass }
    end
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


    private

    def yogaclass_params
      params.require(:yogaclass).permit(:instructor, :weekday, :time)
    end
  end
