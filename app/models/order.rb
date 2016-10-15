class Order < ApplicationRecord
	belongs_to :user
	belongs_to :location
	belongs_to :order

end
