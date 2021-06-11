class Review < ApplicationRecord
    validates :overall_rating, numericality: {greater_than: 0, less_than: 11}
    validates :replayability, numericality: {greater_than: 0, less_than: 11}
    validates :first_time_difficulty, numericality: {greater_than: 0, less_than: 11}
    validates :user_id, uniqueness: {scope: :boardgame_id}
end
