class Api::Synchronize
  class << self
    def synchronize_data response_json
      response_json["data"]["user"].each do |data_user|
        begin
          user = User.find_by email: data_user["email"]
          ActiveRecord::Base.transaction do
            synchronize_user_school data_user, user
            synchronize_user_programming_language data_user
            synchronize_user_courses_data data_user, user
          end
        rescue StandardError
          return false
        end
      end
      true
    end

    private

    def synchronize_user_school data_user, user
      if data_user["profile"]["university"]
        schools = School.all.map &:name
        if check_exists schools, data_user["profile"]["university"]
          school = School.find_by name: data_user["profile"]["university"]
          user_schools = UserSchool.all.map do |user_school|
            [user_school.user_id, user_school.school_id]
          end
          if check_exists user_schools, [school.id, user.id]
            user_school = UserSchool.find_by school_id: school.id,
              user_id: user.id
            user_school.update_attributes end_date: data_user["profile"]["graduation"]
          else
            UserSchool.create school_id: school.id,
              user_id: user.id, end_date: data_user["profile"]["graduation"]
          end
        else
          school = School.create name: data_user["profile"]["university"]
          UserSchool.create school_id: school.id, user_id: user.id,
            end_date: data_user["profile"]["graduation"]
        end
      end
    end

    def synchronize_user_programming_language data_user
      if data_user["courses"]
        data_user["courses"].each do |data_language|
          languages = ProgrammingLanguage.all.map &:name
          unless check_exists languages, data_language["language"]
            ProgrammingLanguage.create name: data_language["language"]
          end
        end
      end
    end

    def synchronize_user_courses_data data_user, user
      if data_user["courses"]
        data_user["courses"].each do |data_course|
          synchronize_course data_course, user
        end
      end
    end

    def synchronize_course data_course, user
      courses = Course.all.map &:name
      programming_language = ProgrammingLanguage.find_by name:
        data_course["language"]
      if check_exists courses, data_course["name"]
        course = Course.find_by name: data_course["name"]

        course.update_attributes start_date: data_course["start_date"],
          end_date: data_course["end_date"], status: data_course["status"],
          programming_language_id: programming_language.id,
          description: data_course["description"]

        user_courses = UserCourse.all.map do |user_course|
          [user_course.course_id, user_course.user_id]
        end

        unless check_exists user_courses, [course.id, user.id]
          UserCourse.create course_id: course.id, user_id: user.id
        end
      else
        course = Course.create name: data_course["name"],
          start_date: data_course["start_date"],
          end_date: data_course["end_date"],
          status: data_course["status"],
          programming_language_id: programming_language.id,
          description: data_course["description"]
        UserCourse.create course_id: course.id, user_id: user.id
      end
      if data_course["subjects"]
        data_course["subjects"].each do |data_subject|
          synchronize_user_subject data_subject, user.id, course.id
        end
      end
    end

    def synchronize_user_subject data_subject, user_id, course_id
      subjects = Subject.all.map &:name
      if check_exists subjects, data_subject["subject_name"]
        subject = Subject.find_by name: data_subject["subject_name"]
        subject.update_attributes description: data_subject["subject_description"]

        user_course_subjects = UserCourseSubject.all.map do |user_course_subject|
          [user_course_subject.user_id, user_course_subject.course_id,
          user_course_subject.subject_id]
        end

        if check_exists user_course_subjects, [user_id, course_id, subject.id]
          user_course_subject = UserCourseSubject.find_by user_id: user_id,
            course_id: course_id, subject_id: subject.id
          user_course_subject.update_attributes start_date: data_subject["start_date"],
            end_date: data_subject["end_date"],
            status: data_subject["status"],
            content: data_subject["subject_content"]
        else
          create_user_course_subject user_id, course_id, subject.id, data_subject
        end
      else
        subject = Subject.create name: data_subject["subject_name"],
          description: data_subject["subject_description"]
        create_user_course_subject user_id, course_id, subject.id, data_subject
      end
      if data_subject["tasks"]
        data_subject["tasks"].each do |data_task|
          synchronize_user_task data_task, user_id, course_id,
            subject.id
        end
      end
    end

    def synchronize_user_task data_task, user_id, course_id, subject_id
      task_type = data_task.keys[0]
      tasks = Task.all.map{|task| [task.name, task.subject_id]}
      if check_exists tasks, [data_task[task_type]["name"], subject_id]
        task = Task.find_by name: data_task[task_type]["name"],
          subject_id: subject_id
        task.update_attributes task_type: task_type,
          description: data_task[task_type]["content"]
        user_tasks = UserTask.all.map do |user_task|
          [user_task.user_id, user_task.task_id]
        end

        if check_exists user_tasks, [user_id, task.id]
          user_task = UserTask.find_by user_id: user_id, task_id: task.id
          user_task.update_attributes status: data_task[task_type]["status"]
        else
          create_user_task  user_id, course_id, subject_id, task.id,
            data_task[task_type]["status"]
        end
      else
        task = Task.create name: data_task[task_type]["name"],
          subject_id: subject_id, task_type: task_type,
          description: data_task[task_type]["content"]
        create_user_task  user_id, course_id, subject_id, task.id,
          data_task[task_type]["status"]
      end
    end

    def create_user_course_subject user_id, course_id, subject_id, data_subject
      UserCourseSubject.create user_id: user_id, course_id: course_id,
        subject_id: subject_id, start_date: data_subject["start_date"],
        end_date: data_subject["end_date"], status: data_subject["status"],
        content: data_subject["subject_content"]
    end

    def create_user_task user_id, course_id, subject_id, task_id, status
      UserTask.create user_id: user_id,
        task_id: task_id, subject_id: subject_id,
        course_id: course_id,
        status: status
    end

    def check_exists arrays, element
      arrays.include? element
    end
  end
end
