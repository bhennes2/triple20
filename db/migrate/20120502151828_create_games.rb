class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :player1
      t.string :player2
      t.integer :player1_score      
      t.integer :player2_score
      t.integer :winner
      
      t.timestamps
    end
  end
end
