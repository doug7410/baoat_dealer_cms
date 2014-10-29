class AddAttributesToBoats < ActiveRecord::Migration
  def change
    add_column :boats, :year, :string
    add_column :boats, :boat_only_price, :integer
    add_column :boats, :message, :text
    add_column :boats, :series_id, :integer
  end
end
