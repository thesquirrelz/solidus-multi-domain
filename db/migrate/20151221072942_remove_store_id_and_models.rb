class RemoveStoreIdAndModels < ActiveRecord::Migration
  def change
    drop_table :spree_store_shipping_methods if table_exists?('spree_store_shipping_methods')
    remove_index :spree_store_shipping_methods, :store_id if index_exists?(:spree_store_shipping_methods, :store_id)
    remove_index :spree_store_shipping_methods, :shipping_method_id if index_exists?(:spree_store_shipping_methods, :shipping_method_id)
    drop_table :spree_store_payment_methods if table_exists?('spree_store_payment_methods')
    drop_table :spree_promotion_rules_stores if table_exists?('spree_promotion_rules_stores')
    remove_column :spree_trackers, :store_id, :integer
  end
end
