class YogaclassSerializer < ActiveModel::Serializer

  attributes: :id, :name, :time, :weekday, :instructor
  has_many :subrequests
  has_many :assistants, through: :subrequests

end
