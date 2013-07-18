class AddEmailToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :email, null: false
    end
  end
end
