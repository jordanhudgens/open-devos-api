class PlanAssignmentSerializer < ActiveModel::Serializer
  attributes :id,
             :user_id,
             :plan_id,
             :status

  belongs_to :user
  belongs_to :plan
end
