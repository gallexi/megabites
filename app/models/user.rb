class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  belongs_to :organization
  has_many :orders
  has_many :negotiations
  belongs_to :location
  has_many :messages

end
