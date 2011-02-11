class CreateSolvings < ActiveRecord::Migration
  def self.up
    create_table :solvings do |t|
      t.references :user
      t.references :crossword
      t.text :data
      t.integer :time
      t.integer :completeness, :default => 0
      t.boolean :solved, :default => false
    end
  end

  def self.down
    drop_table :solvings
  end
end
