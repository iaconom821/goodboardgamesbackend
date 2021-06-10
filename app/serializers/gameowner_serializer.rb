class GameownerSerializer < ActiveModel::Serializer
    attributes :user_id, :boardgame_id
    has_one :boardgame 
  end