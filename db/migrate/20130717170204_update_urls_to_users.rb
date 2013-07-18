class UpdateUrlsToUsers < ActiveRecord::Migration
  def change
    change_table :urls do |t|
      t.belongs_to :user
    end
  end
end
