class Stay < ApplicationRecord
  # maybe change from optional so that stay must have host
  belongs_to :host, optional: true
  belongs_to :guest, optional: true

  after_create :assign_host

  validates :cost, presence: true
  validates :title, presence: true
  validates :location, presence: true

  def host_first_name=(host_first_name)
    if !host_first_name.nil? && host_first_name != ""
      @host_first_name = host_first_name
    end
  end

  def host_first_name
    self.host ? self.host.first_name : nil
  end

  def host_last_name=(host_last_name)
    if !host_last_name.nil? && host_last_name != ""
      @host_last_name = host_last_name
    end
  end

  def host_last_name
    self.host ? self.host.last_name : nil
  end

  def host_email=(host_email)
    if !host_email.nil? && host_email != ""
      @host_email = host_email
    end
  end

  def host_email
    self.host ? self.host.email : nil
  end

  def host_phone=(host_phone)
    if !host_phone.nil? && host_phone != ""
      @host_phone = host_phone
    end
  end

  def host_phone
    self.host ? self.host.phone : nil
  end

  def assign_host
    self.host = Host.find_or_create_by(first_name: @host_first_name, last_name: @host_last_name, email: @host_email, phone: @host_phone)
  end
end
