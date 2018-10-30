class PlanAssignmentsController < ApplicationController
  def index
    plans = Plan.where(id: @current_user.plan_assignments.pluck(:plan_id))
    render json: plans
  end

  def last_plan
    if @current_user.plan_assignments.any?
      render json: @current_user.plan_assignments.last
    else
      render json: { plan_assignment: false }
    end
  end

  def create
    @plan_assignment = PlanAssignment.new(plan_assignment_params)

    if @plan_assignment.save
      render json: @plan_assignment, status: :created, location: @plan_assignment
    else
      render json: @plan_assignment.errors, status: :unprocessable_entity
    end
  end

  def update
    # TODO
    # Ability to update the status (completed, archived)
  end

  private

    def plan_assignment_params
      params.require(:plan_assignment).permit(
        :user_id,
        :plan_id,
        :status
      )
    end
end
