class User < ActiveRecord::Base
  # users.password_hash in the database is a :string
  include BCrypt

  has_many :rounds
  has_many :decks, through: :rounds
  # Remember to create a migration!

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
