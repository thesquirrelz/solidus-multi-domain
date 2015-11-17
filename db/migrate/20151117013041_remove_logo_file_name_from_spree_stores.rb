class RemoveLogoFileNameFromSpreeStores < ActiveRecord::Migration
  def change
    remove_column :spree_stores, :logo_file_name, :string
  end
end
