class CreateUsersessions < ActiveRecord::Migration[6.1]
  def change
    create_table :usersessions do |t|
      t.string :date
      t.belongs_to :session, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
    
      t.timestamps
    end
  end
end
