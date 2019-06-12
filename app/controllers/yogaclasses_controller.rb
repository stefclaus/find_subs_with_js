class YogaclassesController < ApplicationController

  def index
    @yogaclasses = Yogaclass.all
  end

end
