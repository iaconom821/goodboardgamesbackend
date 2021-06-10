class Boardgame < ApplicationRecord
    has_many :reviews 
    has_many :gameowners
    has_many :owners, through: :gameowners, source: :user
end
