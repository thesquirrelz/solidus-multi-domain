module SolidusMultiDomain
  module MultiDomainHelpers
    def self.included(receiver)
      receiver.send :helper, 'spree/products'
      receiver.send :helper, 'spree/taxons'

      receiver.send :before_filter, :add_current_store_id_to_params
      receiver.send :helper_method, :current_store
    end

    def current_store
      @current_store ||= Spree::Store.current(store_key) ? Spree::Store.current(store_key) : Spree::Store.first
    end

    def get_taxonomies
      @taxonomies ||= current_store.present? ? Spree::Taxonomy.where(store_id: current_store.id) : Spree::Taxonomy
      @taxonomies.includes(root: :children)
    end

    def add_current_store_id_to_params
      params[:current_store_id] = current_store.try(:id)
    end

    private

    def store_key
      request.headers['HTTP_SPREE_STORE'] || request.env['SERVER_NAME']
    end
  end
end
