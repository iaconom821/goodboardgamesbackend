class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :password_digest, :profile_picture, :usersessions 
  
  has_many :owned_games, source: :boardgames
  has_many :sessions
end
