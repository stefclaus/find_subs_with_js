class YogaclassesController < ApplicationController

  def index
    @yogaclasses = Yogaclass.all
  end

  def show
    @yogaclass = Yogaclass.find(params[:id])
   #@ride = @attraction.rides.build(user_id:current_user.id)
  end


end
