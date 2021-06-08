class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :description
      t.integer :overall_rating
      t.integer :replayability
      t.integer :first_time_difficulty
      t.belongs_to :user, null: false, foreign_key: true 
      t.belongs_to :boardgame, null: false, foreign_key: true 

      t.timestamps
    end
  end
end
