class DevoPolicy
  attr_reader :user, :devo

  def initialize(user, devo)
    @user = user
    @devo = devo
  end

  def update?
    devo.plan.user == user
  end

  def destroy?
    update?
  end
end
