class User < ApplicationRecord
    has_secure_password
    has_many :reviews 
    has_many :gameowners
    has_many :owned_games, through: :gameowners, source: :boardgame
    has_many :usersessions 
    has_many :sessions, through: :usersessions
   
end
