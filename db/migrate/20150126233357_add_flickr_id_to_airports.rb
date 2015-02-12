class AddFlickrIdToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :flickr_id, :string
    add_column :airports, :calendar_address, :string
  end
end
