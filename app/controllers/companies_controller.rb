class CompaniesController < ApplicationController
  load_resource only: %i(create show)

  def create
    @company.creator = current_user
    if current_user.company.nil? && @company.save
      current_user.update_attributes company_id: @company.id
      render json: {status: :success, message: t(".success"),
        location: employer_company_dashboards_path(@company)}
    else
      render json: {
        status: :error, message: t(".fail"),
        errors: @company.errors.messages
      }
    end
  end

  def show
    @company_jobs = @company.jobs.includes(:images)
      .page(params[:page]).per Settings.company.per_page
    @following = User.filter_trainee(@company.all_following.pluck(:id), "ASC", "id", "users")
      .includes(:avatar).page(params[:page]).per Settings.company.show.following.per_page

    if request.xhr?
      render json: {
        content: render_to_string(partial: "company_jobs",
          locals: {company_jobs: @company_jobs, company: @company},
          layout: false),
        html: render_to_string(partial: "show_following", layout: false),
        paginate: render_to_string(partial: "paginate", layout: false,
          locals: {following: @following})
      }
    end
  end

  private

  def company_params
    params.require(:company).permit Company::ATTRIBUTES
  end
end
