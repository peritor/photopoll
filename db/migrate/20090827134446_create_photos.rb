class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :name    
      t.string :body_file_name
      t.string :body_content_type
      t.integer :body_file_size
      t.datetime :body_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
