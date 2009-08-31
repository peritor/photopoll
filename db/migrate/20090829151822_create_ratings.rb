class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :photo_id
      t.integer :value
      t.text :comment
      t.timestamps
    end
    
    add_index :ratings, [:photo_id, :created_at]
  end

  def self.down
    drop_table :ratings
  end
end
