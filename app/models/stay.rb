class Stay < ApplicationRecord
  # maybe change from optional so that stay must have host
  belongs_to :host, optional: true
  belongs_to :guest, optional: true

  # after_create :assign_host

  validates :cost, presence: true
  validates :title, presence: true
  validates :location, presence: true
  # validates :host_first_name, presence: true
  # validates :host_last_name, presence: true
  # validates :host_email, presence: true
  # validates :host_phone, presence: true

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

  # def assign_host
  #   @host = Host.find(email: @host_email)
  #
  #   # if @host
  #   #   self.host = @host
  #   #   self.save
  #   # # else
  #   # #   @new_host = Host.create(first_name: @host_first_name, last_name: @host_last_name, phone: @host_phone, email: @host_email)
  #   # #   self.host = @new_host
  #   # #   self.save
  #   # end
  #   binding.pry
  # end

end
