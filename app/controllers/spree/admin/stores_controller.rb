class Spree::Admin::StoresController < Spree::Admin::ResourceController
  def index
    # @stores = @stores.ransack({ name_or_domains_or_code_cont: params[:q] }).result if params[:q]
    @stores = @stores.ransack({ name_or_code_cont: params[:q] }).result if params[:q]
    @stores = @stores.where(id: params[:ids].split(',')) if params[:ids]

    respond_with(@stores) do |format|
      format.html
      format.json
    end
  end
end
