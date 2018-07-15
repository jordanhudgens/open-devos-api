class PlanAssignmentsController < ApplicationController
  skip_before_action :authenticate_user, only: [:show]

  def index
    render json: @current_user.plans
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
