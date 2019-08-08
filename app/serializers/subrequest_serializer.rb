class SubrequestSerializer < ActiveModel::Serializer
  attributes :id, :chief_complaint, :transportation_type, :street_address, :locality, :region, :postal_code, :user_id, :category_id

  belongs_to :yogaclass
  belongs_to :assistant

end
