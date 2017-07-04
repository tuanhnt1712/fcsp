class CandidatesController < ApplicationController
  before_action :load_job, only: %i(create destroy)

  def create
    current_user.apply_job(@job) if can_apply_job?
  end

  def destroy
    current_user.unapply_job(@job) if can_apply_job?
  end

  private

  def load_job
    @job = Job.find_by id: params[:id]

    return not_found unless @job
  end

  def can_apply_job?
    Supports::ShowJob.new(@job, current_user).can_apply_job?
  end
end
