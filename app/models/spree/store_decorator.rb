module Spree
  Store.class_eval do
    has_and_belongs_to_many :products, join_table: 'spree_products_stores'
    has_many :taxonomies
    has_many :orders
  end
end
