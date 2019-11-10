class Guest < ApplicationRecord
  has_many :stays
  has_many :hosts, through: :stays
end
