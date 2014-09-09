class Renamecolumn < ActiveRecord::Migration
  def up
  	rename_column :order_transactions, :order_id, :purchase_id
  end

  def down
  end
end
