require 'bcrypt'
require 'rack-flash'

class User
	include DataMapper::Resource

  has n, :peeps, :through => Resource

  attr_reader :password
  attr_accessor :password_confirmation

	property :id, Serial
	property :email, String, :unique => true
  property :password_digest, Text
  property :username, String, :unique => true
  property :full_name, String

  def password=(password)
    @password = password
  	self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password, :message => "Passwords don't match"
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    user = first(:email => email)
    
    if user && BCrypt::Password.new(user.password_digest) == password
      user

    else
      nil
    end
  end


end
