class Employer::TraineesController < Employer::BaseController
  def index
    @trainees = User.select_role :trainee

    if params[:type]
      sort_by = params[:sort].nil? ? "ASC" : params[:sort]
      @trainees = @trainees.filter_trainee(params[:array_id],
        sort_by, params[:type]).page(params[:page])
        .per Settings.employer.trainees.per_page
    else
      @trainees = @trainees.page(params[:page])
        .per Settings.employer.trainees.per_page
    end


    if request.xhr?
      render json: {
        html_job: render_to_string(partial: "trainee",
          locals: {trainee: @trainees}, layout: false),
        pagination_candidate: render_to_string(partial: "paginate",
          layout: false, locals: {trainee: @trainees})
      }
    else
      respond_to do |format|
        format.html
      end
    end
  end
end
