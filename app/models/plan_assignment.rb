class PlanAssignment < ApplicationRecord
  belongs_to :plan, counter_cache: true
  belongs_to :user
  belongs_to :devo, optional: true

  after_initialize :set_defaults

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

  private

    def set_defaults
      self.devo ||= self.plan.devos.order('position asc').first
    end
end
