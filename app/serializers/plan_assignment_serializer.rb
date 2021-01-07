class PlanAssignmentSerializer < ActiveModel::Serializer
  attributes :created_at,
             :devo_count,
             :id,
             :plan_id,
             :status,
             :updated_at,
             :user_id

  belongs_to :user
  belongs_to :plan
end
