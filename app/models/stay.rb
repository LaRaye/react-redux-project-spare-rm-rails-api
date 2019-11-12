class Stay < ApplicationRecord
  # maybe change from optional so that stay must have host
  belongs_to :host, optional: true
  belongs_to :guest, optional: true

  validates :cost, presence: true
  validates :title, presence: true
  validates :location, presence: true

  def host_name=(host_name)
    if !host_name.nil? && host_name != ""
      first_name = host_name.split(" ")[0]
      last_name = host_name.split(" ")[1]

      self.host = Host.find_or_create_by(first_name: first_name, last_name: last_name)
    end
  end

  def host_name
    self.host ? self.host.full_name : nil
  end
end
