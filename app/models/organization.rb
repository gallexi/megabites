class Organization < ApplicationRecord
	has_many :users
	has_many :orders
	has_many :locations
end
