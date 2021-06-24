class BoardgameSerializer < ActiveModel::Serializer
  attributes :id, :title, :manufacturer, :description, :upc_code, :image, :sessions
  has_many :reviews
end
