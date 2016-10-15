class Negotiation < ApplicationRecord
	belongs_to :user
	has_many :messages

	def is_customer?(user_id)
		if self.customers.nil?
			return false
		else
			return self.customers.split(",").map{|s| s.to_i}.include?(user_id)
		end
	end
end
