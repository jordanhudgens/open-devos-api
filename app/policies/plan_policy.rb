class PlanPolicy
  attr_reader :user, :plan

  def initialize(user, plan)
    @user = user
    @plan = plan
  end

  def update?
    plan.user == user
  end

  def destroy?
    update?
  end
end
