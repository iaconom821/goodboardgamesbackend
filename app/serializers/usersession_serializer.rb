class UsersessionSerializer < ActiveModel::Serializer
  attributes :id, :date
  has_one :session
  has_one :user
end
