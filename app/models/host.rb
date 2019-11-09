class Host < ApplicationRecord
  has_many :stays, dependent: :destroy
  has_many :guests, through: :stays
end
