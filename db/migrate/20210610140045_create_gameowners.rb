class CreateGameowners < ActiveRecord::Migration[6.1]
  def change
    create_table :gameowners do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :boardgame, null: false, foreign_key: true

      t.timestamps
    end
  end
end
