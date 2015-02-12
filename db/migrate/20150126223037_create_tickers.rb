class CreateTickers < ActiveRecord::Migration
  def change
    create_table :tickers do |t|
      t.string :airport_id
      t.text :ticker_item

      t.timestamps null: false
    end
  end
end
