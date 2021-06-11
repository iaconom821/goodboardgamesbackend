class Gameowner < ApplicationRecord
  belongs_to :user
  belongs_to :boardgame

  validates :user_id, uniqueness: { scope: :boardgame_id }
end
