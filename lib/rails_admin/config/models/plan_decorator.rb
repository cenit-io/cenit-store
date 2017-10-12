Plan.class_eval do

  def interval_enum
    {
        'daily' => 'day',
        'monthly' => 'month',
        'yearly' => 'year',
        'week' => 'week',
        '3-month' => 'every 3 months',
        '6-month' => 'every 6 months',
    }
  end

  rails_admin do
    weight 810
    navigation_label 'Administration'

    list do
      field :name
      field :amount
      field :interval
      field :stripe_id
      field :created_at
    end

    edit do
      group :stripe_data do
        visible { bindings[:object].new_record? }
        field :name
        field :amount
        field :interval
        field :stripe_id
        field :stripe_id
      end
      group :available_resources do
        visible { bindings[:object].new_record? }
        field :tenants
        field :flow_settings
        field :standard_transactions
        field :commerce_transactions
        field :records_of_objects
        field :connections
        field :polling_cycle
        field :flow_history
        field :support
        field :custom_service
      end
      group :appearance do
        field :color, :color
      end
    end
  end

end
