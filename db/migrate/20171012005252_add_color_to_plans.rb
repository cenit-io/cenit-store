class AddColorToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :color, :string, :default => '#111575', :null => false
  end
end
