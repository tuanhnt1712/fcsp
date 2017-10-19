class CoursesController < ApplicationController
  load_resource :user, id_param: :user_id, parent: false, only: :show
  load_resource through: :user, only: :show

  def show
    @user_object = Supports::ShowUser.new @user, current_user, params
    @user_course_subjects = @course.user_course_subjects.includes :subject

    if request.xhr?
      render json: {
        status: :success,
        html: render_to_string(partial: "courses/course_details",
          locals: {user: @user, course: @course, subjects: @user_course_subjects},
          layout: false)
      }
    end
  end
end
