class YogaclassesController < ApplicationController
  before_action :require_logged_in

  def index
    @yogaclasses = Yogaclass.all
  end

  def show
    @yogaclass = Yogaclass.find(params[:id])
   #@ride = @attraction.rides.build(user_id:current_user.id)
  end


end
