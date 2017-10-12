class AddResourcesToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :tenants, :integer, :default => 1, :null => false
    add_column :plans, :flow_settings, :integer, :default => 2, :null => false
    add_column :plans, :standard_transactions, :integer, :default => 1000, :null => false
    add_column :plans, :commerce_transactions, :integer, :default => 100, :null => false
    add_column :plans, :records_of_objects, :integer, :default => 2000, :null => false
    add_column :plans, :connections, :integer, :default => 5, :null => false
    add_column :plans, :polling_cycle, :integer, :default => 20, :null => false
    add_column :plans, :flow_history, :integer, :default => 7, :null => false
    add_column :plans, :support, :string, :default => 'slack-channel', :null => false
    add_column :plans, :custom_service, :string, :default => 'self-service', :null => false
  end
end
