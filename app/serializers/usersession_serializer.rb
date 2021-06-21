class UsersessionSerializer < ActiveModel::Serializer
  attributes :id, :date
  belongs_to :session
  has_one :user
end
