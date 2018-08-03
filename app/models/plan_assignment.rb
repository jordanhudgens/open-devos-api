class PlanAssignment < ApplicationRecord
  belongs_to :plan
  belongs_to :user

  enum status: {
    started: 0,
    completed: 1,
    archived: 2
  }

  def devo_count
    if self.plan.devos.any?
      self.plan.devos.count
    else
      0
    end
  end
end
