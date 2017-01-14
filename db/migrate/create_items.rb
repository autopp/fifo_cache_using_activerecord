class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string text
    end
  end

  def self.down
    drop_table :posts
  end
end
