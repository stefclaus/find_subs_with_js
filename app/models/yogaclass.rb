class Yogaclass < ApplicationRecord

  has_many :subrequests
	has_many :assistants, through: :subrequests


end
