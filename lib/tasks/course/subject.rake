namespace :db do
  desc "create subject"
  task subject: :environment do
    subjects = [
      {
        name: "Git Tutorial",
        subject_description: "Start Git for your project today.\r\n",
        subject_content: "<p>Get an introduction to github, code version management</p>\r\n",
        status: "finished", start_date: "2016-10-03", end_date: "2016-10-05"
      },
      {
        name: "Ruby's Project 1",
        subject_description: "Start Project 1 for Ruby on Rails today.\r\n",
        subject_content: "<p>Get an introduction to redmine, requirement, design database</p>\r\n", status: "finished", start_date: "2016-11-22", end_date: "2017-02-08"
      },
      {
        name: "Ruby's Project 2",
        subject_description: "Start Project 2 for Ruby on Rails today.\r\n",
        subject_content: "<p>Get an introduction to redmine, requirement, design database</p>\r\n",
        status: "finished",
        start_date: "2017-02-08", end_date: "2017-03-08"
      },
      {
        name: "Ruby on Rails Tutorial Book",
        subject_description: "Learn the basic building blocks of Ruby, all in the browser.\r\n",
        subject_content: "<p>Get an introduction to numbers, Strings, properties, and methods,&nbsp; Learn about conversions, arrays, variables, and more methods</p>\r\n",
        status: "finished", start_date: "2016-10-05", end_date: "2016-12-15"
      }
    ]

    course = Course.find_by name: "[KN] Ruby on Rails 03/10/2016"
    user = User.find_by email: "tran.tuan.nghia@framgia.com"

    subjects.each do |subject|
      subject_created = Subject.create! name: subject[:name], description: subject[:subject_description]
      UserCourseSubject.create! user_id: user.id, course_id: course.id,
        subject_id: subject_created.id, start_date: subject[:start_date],
        end_date: subject[:end_date], status: subject[:status],
        content: "Basic for work!"
    end
  end
end
