class User < ApplicationRecord
    has_secure_password
    has_many :reviews 
    has_many :gameowners
    has_many :owned_games, through: :gameowners, source: :boardgame
end
