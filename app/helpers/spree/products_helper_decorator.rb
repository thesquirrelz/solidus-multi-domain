module Spree
  module Api
    ProductsHelper.class_eval do
      def get_taxonomies
        @taxonomies ||= current_store.present? ? Spree::Taxonomy.where(store_id: current_store.id) : Spree::Taxonomy
        @taxonomies.includes(root: :children)
      end
    end
  end
end