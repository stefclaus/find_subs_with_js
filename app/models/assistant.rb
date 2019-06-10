class Assistant < ApplicationRecord

  validates :name, :email, presence: true
	validates :email, uniqueness: true

	has_many :sub_requests
	has_many :categories, through: :reported_issues

	has_secure_password

end
