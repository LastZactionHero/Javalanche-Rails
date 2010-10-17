class CreateHighScores < ActiveRecord::Migration
  def self.up
    create_table :high_scores do |t|
      t.integer :score
      t.string :name
      t.string :comment
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :high_scores
  end
end
