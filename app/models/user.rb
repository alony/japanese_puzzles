class User < ActiveRecord::Base
  acts_as_authentic {|c| c.require_password_confirmation = false}
  
  has_many :puzzles
  has_many :solvings
  
  def full_name
    name || email
  end
end