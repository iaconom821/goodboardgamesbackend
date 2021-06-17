class SessionSerializer < ActiveModel::Serializer
  attributes :id, :date
  has_one :boardgame
end
