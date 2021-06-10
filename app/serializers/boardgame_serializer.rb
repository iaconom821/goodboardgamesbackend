class BoardgameSerializer < ActiveModel::Serializer
  attributes :id, :title, :manufacturer, :description
  has_many :reviews
end
