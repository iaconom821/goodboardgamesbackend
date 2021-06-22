class SessionSerializer < ActiveModel::Serializer
  attributes :id, :date, :players, :boardgame_id, :winner

end
