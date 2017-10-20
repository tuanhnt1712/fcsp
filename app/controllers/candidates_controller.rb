class CandidatesController < ApplicationController
  load_resource :job, parent: false, only: %i(create destroy)

  def create
    current_user.apply_job(@job) if can_apply_job?
  end

  def destroy
    current_user.unapply_job(@job) if can_apply_job?
  end

  private

  def can_apply_job?
    Supports::ShowJob.new(@job, current_user).can_apply_job?
  end
end
