class CreateCrosswords < ActiveRecord::Migration
  def self.up
    create_table :crosswords do |t|
      t.references :author
      t.integer :block_width
      t.integer :block_height
      t.text :data
      t.integer :complexity, :default => 0
      
      # paperclip fields
      t.string :picture_file_name
      t.string :picture_content_type
      t.integer :picture_file_size
    end
  end

  def self.down
    drop_table :crosswords
  end
end
