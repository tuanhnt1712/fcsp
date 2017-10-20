class SubjectsController < ApplicationController
  load_resource :user, id_param: :user_id, parent: false, only: :show
  load_resource :course, id_param: :course_id, through: :user, parent: false, only: :show
  load_resource :user_course_subject, through: :user, parent: false, only: :show

  def show
    @user_object = Supports::ShowUser.new @user, current_user, params
    @user_tasks = @user.user_tasks.includes(:task)
      .check_course_subject params[:course_id], @user_course_subject.subject_id

    if request.xhr?
      render json: {
        status: :success,
        html: render_to_string(
          partial: "subjects/subject_details",
          locals: {user: @user, course: @course, subject: @user_course_subject,
            tasks: @user_tasks}, layout: false)
      }
    end
  end
end
