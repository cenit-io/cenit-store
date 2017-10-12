module ApplicationHelper
  def amount(plan=nil)
    "$#{(plan||@plan).amount / 100.0}"
  end
end
