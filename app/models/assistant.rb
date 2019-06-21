class Assistant < ApplicationRecord

  validates :name, :email, presence: true
	validates :email, uniqueness: true

	has_many :subrequests
	has_many :yogaclasses, through: :subrequests


	has_secure_password

end
