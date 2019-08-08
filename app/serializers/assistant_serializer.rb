class AssistantSerializer < ActiveModel::Serializer
  attributes :id, :comment, :date, :assistant_covering, :assistant_requesting

  has_many :subrequests
	has_many :yogaclasses, through: :subrequests

end
