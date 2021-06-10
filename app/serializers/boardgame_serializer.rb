class BoardgameSerializer < ActiveModel::Serializer
  attributes :id, :title, :manufacturer, :description, :upc_code
  has_many :reviews
end
