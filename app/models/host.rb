class Host < ApplicationRecord
  has_many :stays, dependent: :destroy
  has_many :guests, through: :stays

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :phone, presence: true

  def full_name
    self.first_name + " " + self.last_name
  end
end
