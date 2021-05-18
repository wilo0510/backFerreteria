class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :productcode
      t.string :nameproduct
      t.numeric :unitprice
      t.numeric :quantity

      t.timestamps
    end
  end
end
