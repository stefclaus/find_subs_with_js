class Subrequest < ApplicationRecord
  belongs_to :assistant
	belongs_to :yogaclass

#  scope :is_in_future, -> (date){ where("date = ?", date > today) }
# scope :today, lambda { WHERE('DATE(created_at) = ?', Date.today)}

end
