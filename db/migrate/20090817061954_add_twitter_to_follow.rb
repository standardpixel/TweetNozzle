class AddTwitterToFollow < ActiveRecord::Migration
  def self.up
    add_column :follows, :twitter, :string
  end

  def self.down
    remove_column :follows, :twitter
  end
end
