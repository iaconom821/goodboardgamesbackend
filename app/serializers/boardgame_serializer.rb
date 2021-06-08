class BoardgameSerializer < ActiveModel::Serializer
  attributes :id, :title, :manufacturer, :description
end
