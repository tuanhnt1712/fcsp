namespace :db do
  desc "create task for user"
  task task: :environment do
    tasks = [
      {
        user_email: "tran.tuan.nghia@framgia.com",
        subject_name: "Git Tutorial",
        course_name: "[KN] Ruby on Rails 03/10/2016",
        data: [
          {
            name: "Getting Started", status: "in_progress",
            content: "Get an introduction to project git",
            task_type: "assignments"
          },
          {
            name: "Git Branching", status: "in_progress",
            content: "Get an introduction to project git",
            task_type: "assignments"
          },
          {
            name: "Distributed Git", status: "in_progress",
            content: "Get an introduction to project git",
            task_type: "assignments"
          },
          {
            name: "GitHub", status: "init",
            content: "Get an introduction to project git",
            task_type: "assignments"
          },
          {
            name: "Git Tools", status: "init",
            content: "Get an introduction to project git",
            task_type: "assignments"
          },
          {
            name: "Customizing Git", status: "init",
            content: "Get an introduction to project git",
            task_type: "assignments"
          }
        ]
      },
      {
        user_email: "tran.tuan.nghia@framgia.com", subject_name: "Ruby's Project 1",
        course_name: "[KN] Ruby on Rails 03/10/2016",
        data: [
          {
            name: "Requirement understanding", status: "init",
            content: "Get an introduction to project understanding",
            task_type: "assignments"
          },
          {
            name: "Design Database", status: "in_progress",
            content: "Start design database", task_type: "assignments"
          }
        ]
      }
    ]

    tasks.each do |task|
      user = User.find_by email: task[:user_email]
      subject = Subject.find_by name: task[:subject_name]
      course = Course.find_by name: task[:course_name]

      task[:data].each do |data|
        task_created = Task.create! name: data[:name],
          subject_id: subject.id, task_type: data[:task_type],
          description: data[:content]
        UserTask.create user_id: user.id,
          task_id: task_created.id, subject_id: subject.id,
          course_id: course.id,
          status: data[:status]
      end
    end
  end
end
