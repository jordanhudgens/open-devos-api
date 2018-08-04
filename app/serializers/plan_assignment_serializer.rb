class PlanAssignmentSerializer < ActiveModel::Serializer
  attributes :id,
             :user_id,
             :plan_id,
             :status,
             :devo_count

  belongs_to :user
  belongs_to :plan
  belongs_to :devo
end
