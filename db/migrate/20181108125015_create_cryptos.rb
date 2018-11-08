class CreateCryptos < ActiveRecord::Migration[5.2]
  def change
    create_table :cryptos do |t|
      t.string :currency
      t.string :rates

      t.timestamps
    end
  end
end




