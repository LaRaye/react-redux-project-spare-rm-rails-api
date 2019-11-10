class Stay < ApplicationRecord
  belongs_to :host
  belongs_to :guest, optional: true

  validates :cost, presence: true
  validates :title, presence: true
  validates :location, presence: true
end
