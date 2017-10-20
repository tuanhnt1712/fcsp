class OrganizationsController < ApplicationController
  load_resource only: :show

  def show
    check_organization
    @related_orgs = Organization.except_org(@organization)
      .of_ids(UserWork.related_org_ids_of(@organization).pluck :organization_id)
    @new_jobs = Job.includes(:images, :company).newest
      .limit Settings.organization.new_job
  end

  private

  def check_organization
    return unless @company = Company.find_by(name: @organization.name)
    redirect_to @company
  end
end
