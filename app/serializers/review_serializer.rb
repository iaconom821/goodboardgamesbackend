class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :overall_rating, :replayability, :first_time_difficulty, :user_id, :boardgame_id
end
