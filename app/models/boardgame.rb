class Boardgame < ApplicationRecord
    has_many :reviews 
    has_many :gameowners
    has_many :owners, through: :gameowners, source: :user

    validates :upc_code, uniqueness: true 
    validates :title, presence: true
    validates :description, presence: true
    validates :brand, presence: true 
end
