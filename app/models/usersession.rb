class Usersession < ApplicationRecord
  belongs_to :session
  belongs_to :user

  validates :user_id, uniqueness: { scope: :session_id }
end
