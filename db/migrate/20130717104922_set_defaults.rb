class SetDefaults < ActiveRecord::Migration
  def change
    change_table :urls do |t|
      change_column_null(:urls, :full_url, false)
      t.change_default(:clicks, 0)
    end
  end
end