class PlanPolicy
  attr_reader :user, :plan

  def initialize(user, plan)
    @user = user
    @plan = plan
  end

  def update?
    puts "PLAN USER" * 500, user.inspect, "plan user" * 500
    puts "PLAN USER" * 500, plan.inspect, "plan user" * 500
    plan.user == user
  end

  def destroy?
    update?
  end
end
