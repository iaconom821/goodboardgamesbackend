class BoardgameSerializer < ActiveModel::Serializer
  attributes :id, :title, :manufacturer, :description, :upc_code, :image
  has_many :reviews
end
