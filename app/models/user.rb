class User < ActiveRecord::Base
  has_many :lists
  devise :database_authenticatable, :registerable, :recoverable, 
  		 :rememberable, :trackable, :validatable

  VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates :name, presence: true, length: {maximum: 70}
  validates :username, presence: true, uniqueness: {case_sensitive: false}

  validates :email, format: { with: VALID_EMAIL_FORMAT}, uniqueness: {case_sensitive: false}
  
  before_save :re_format

  private

  def re_format
  	self.email = email.downcase
  	self.username = username.downcase
  end
end
