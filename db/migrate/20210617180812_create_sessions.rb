class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.string :date
      t.belongs_to :boardgame, null: false, foreign_key: true
      t.integer :winner
      
      t.timestamps
    end
  end
end
