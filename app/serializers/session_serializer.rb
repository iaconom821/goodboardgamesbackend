class SessionSerializer < ActiveModel::Serializer
  attributes :id, :date, :players
  belongs_to :boardgame

end
