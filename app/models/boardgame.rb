class Boardgame < ApplicationRecord
    has_many :reviews 
    has_many :gameowners
    has_many :owners, through: :gameowners, source: :user
    has_many :sessions 

    validates :upc_code, uniqueness: true 
    validates :title, presence: true
    validates :description, presence: true
    validates :manufacturer, presence: true 
end
