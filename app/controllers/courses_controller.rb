class CoursesController < ApplicationController
  before_action :find_user, only: :show
  before_action :find_course, only: :show

  def show
    @user_object = Supports::ShowUser.new @user, current_user, params
    user_course_subjects = @course.user_course_subjects.includes :subject
    if request.xhr?
      render json: {
        status: :success,
        html: render_to_string(partial: "courses/course_details",
          locals: {user: @user, course: @course, subjects: user_course_subjects},
          layout: false)
      }
    else
      @user_course_subjects = user_course_subjects
    end
  end

  private

  def find_user
    @user = User.find_by id: params[:user_id]

    return if @user
    flash[:danger] = t ".user_not_found"
    redirect_to root_url
  end

  def find_course
    @course = @user.courses.find_by id: params[:id]

    return if @course
    flash[:danger] = t ".course_not_found"
    redirect_to @user
  end
end
