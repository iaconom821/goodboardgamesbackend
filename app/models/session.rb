class Session < ApplicationRecord
  belongs_to :boardgame
  has_many :usersessions

  validates :date, presence: true

  def players
      self.usersessions.map{ |us| us.user }
  end

  def winner_profile
    User.find(self.winner)
  end

end
