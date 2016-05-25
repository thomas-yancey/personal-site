class Email < ActiveRecord::Base

  validates_format_of :address,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :message, presence: true

end
