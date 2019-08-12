class AssistantSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  has_many :subrequests
	has_many :yogaclasses, through: :subrequests

end
