class PlansController < ApplicationController
  def index
    @plans = Plan.order(:amount)
  end
end
