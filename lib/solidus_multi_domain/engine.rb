module SolidusMultiDomain
  class Engine < Rails::Engine
    engine_name 'solidus_multi_domain'

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      %w(app lib).each do |dir|
        Dir.glob(File.join(File.dirname(__FILE__), "../../#{dir}/**/*_decorator*.rb")) do |c|
          Rails.application.config.cache_classes ? require(c) : load(c)
        end
      end

      Spree::Config.searcher_class = Spree::Search::MultiDomain
      ApplicationController.send :include, SolidusMultiDomain::MultiDomainHelpers
    end

    config.to_prepare &method(:activate).to_proc

    initializer 'current order decoration' do |app|
      require 'spree/core/controller_helpers/order'
      ::Spree::Core::ControllerHelpers::Order.module_eval do
        def current_order_with_multi_domain(options = {})
          options[:create_order_if_necessary] ||= false
          current_order_without_multi_domain(options)

          if @current_order and current_store and @current_order.store.blank?
            @current_order.update_attribute(:store_id, current_store.id)
          end

          @current_order
        end
        alias_method_chain :current_order, :multi_domain
      end
    end
  end
end
