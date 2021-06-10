class Gameowner < ApplicationRecord
  belongs_to :user
  belongs_to :boardgame
end
