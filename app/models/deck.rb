class Deck < ActiveRecord::Base
  has_many :rounds, :dependent => :destroy
  has_many :users, through: :rounds
  has_many :cards, :dependent => :destroy
  validates :title, :uniqueness => {:case_sensitive => false}
  # Remember to create a migration!
end
