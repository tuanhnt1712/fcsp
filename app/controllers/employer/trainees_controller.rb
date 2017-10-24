class Employer::TraineesController < Employer::BaseController
  load_resource :company, id_param: :company_id, parent: false
  load_resource :user, id_param: :id, parent: false, only: %i(follow unfollow)
  before_action :courses_all, :trainees_all, :programming_languages_all, only: :index

  def index
    if params[:type]
      sort_by = params[:sort].nil? ? "ASC" : params[:sort]
      @trainees = @trainees_all.filter_trainee(params[:array_id],
        sort_by, params[:type]).page(params[:page])
        .per Settings.employer.trainees.per_page
    else
      @trainees = @trainees_all.page(params[:page]).per Settings.employer.trainees.per_page
    end

    if request.xhr?
      render json: {
        html_job: render_to_string(partial: "filter_trainee",
          locals: {trainee: @trainees}, layout: false),
        pagination_candidate: render_to_string(partial: "paginate",
          layout: false, locals: {trainee: @trainees}),
        filter_name: render_to_string(partial: "filter_name", layout: false),
        filter_birthday: render_to_string(partial: "filter_birthday", layout: false)
      }
    else
      respond_to do |format|
        format.html
      end
    end
  end

  def follow
    @company.follow @user
    render json: {
      html: render_to_string(partial: "follow_trainee", layout: false, locals: {trainee: @user})
    }
  end

  def unfollow
    @company.stop_following @user
    render json: {
      html: render_to_string(partial: "follow_trainee", layout: false, locals: {trainee: @user})
    }
  end

  private

  def trainees_all
    @trainees_all = User.trainee.includes(:avatar).left_outer_joins courses: :programming_language
    @trainees_all = @trainees_all.filter_trainee_course params[:select] if params[:select].present?
    @trainees_all = @trainees_all.filter_trainee_programming_language params[:select_language] if params[:select_language].present?
  end

  def courses_all
    @courses_all = Course.all
  end

  def programming_languages_all
    @programming_languages = ProgrammingLanguage.all
  end
end
