class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :password_digest, :profile_picture
  has_many :gameowners
end
