class Organization < ApplicationRecord
	has_many: users
	has_many: orders
end
