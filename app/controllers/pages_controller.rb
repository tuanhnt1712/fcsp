class PagesController < ApplicationController
  def index
    @jobs = Job.active.newest.includes(:images, company: :images)
      .page(params[:page]).per Settings.jobs.per_page
    if request.xhr?
      render json: {jobs: render_to_string(partial: "pages/job", locals: {jobs: @jobs}, layout: false),
        paginate: render_to_string(partial: "pages/paginate", layout: false)}
    end
  end
end
