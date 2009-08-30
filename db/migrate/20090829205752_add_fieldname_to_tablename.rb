class AddFieldnameToTablename < ActiveRecord::Migration
  def self.up
    add_column :follows, :clique_id, :integer
  end

  def self.down
    remove_column :follows, :clique_id
  end
end
