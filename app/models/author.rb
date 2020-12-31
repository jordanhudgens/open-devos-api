class Author < User
  def self.with_published_plans
    left_outer_joins(:plans)
      .where
      .not(plans: { id: nil, status: 'draft' })
      .uniq
  end

  def self.with_plans
    left_outer_joins(:plans)
      .where
      .not(plans: { id: nil })
      .uniq
  end
end
