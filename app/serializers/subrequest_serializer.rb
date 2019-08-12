class SubrequestSerializer < ActiveModel::Serializer
  attributes :id, :comment, :date, :assistant_covering, :assistant_requesting, :assistant_id, :yogaclass_id

  belongs_to :yogaclass
  belongs_to :assistant

end
