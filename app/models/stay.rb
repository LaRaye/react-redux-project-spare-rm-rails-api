class Stay < ApplicationRecord
  belongs_to :host
  belongs_to :guest, optional: true
end
