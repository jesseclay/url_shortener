class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :full_url
      t.integer :clicks
      t.timestamps
    end
  end
end
