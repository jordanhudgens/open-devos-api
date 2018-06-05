class DevoPolicy
  attr_reader :user, :plan

  def initialize(user, devo)
    @user = user
    @devo = devo
  end

  def update?
    devo.plan.user == user
  end
end
