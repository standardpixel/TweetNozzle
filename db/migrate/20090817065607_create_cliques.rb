class CreateCliques < ActiveRecord::Migration
  def self.up
    create_table :cliques do |t|
      t.string :name
      t.boolean :hidden
      t.integer :importance

      t.timestamps
    end
  end

  def self.down
    drop_table :cliques
  end
end
