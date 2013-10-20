class CreateTests < ActiveRecord::Migration
  def change
  	execute "create extension hstore"
    create_table :tests do |t|
    	t.string :scores, array: true
    	t.hstore :teams
    end
  end
end

