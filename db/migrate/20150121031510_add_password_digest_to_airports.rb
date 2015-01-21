class AddPasswordDigestToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :password_digest, :string
  end
end
