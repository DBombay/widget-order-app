class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.string :widget_type
      t.string :color
      t.integer :quantity
      t.datetime :need_by

      t.timestamps
    end
  end
end
