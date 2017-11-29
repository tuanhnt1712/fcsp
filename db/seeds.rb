require "ffaker"

puts "Create companies"
companies = {
  "FPT software": "Hoang Nam Tien",
  "BraveBits": "Alex Ferguson",
  "VC Corp": "Vuong Vu Thang",
  "Ipcoms": "Vu Minh Tuan"
}

default_user = User.create! name: "Hoang Thi Nhung",
  email: "hoang.thi.nhung@framgia.com",
  password: "123456",
  role: "employer"

default_company = Company.create! name: "Framgia VietNam",
  introduction: "ARE YOU READY TO MAKE IT AWESOME WITH US?",
  website: FFaker::Internet.domain_name,
  founder: "Kobayashi Taihei",
  company_size: 100, founder_on: FFaker::Time.datetime,
  creator_id: default_user.id

InfoUser.create! user_id: default_user.id,
  introduction: "hello world, i am developer",
  address: "Ha Noi, Viet Nam",
  phone: "123456789"

companies.each do |name, founder|
  Company.create! name: name,
    introduction: "ARE YOU READY TO MAKE IT AWESOME WITH US?",
    website: FFaker::Internet.domain_name, founder: founder,
    company_size: 100, founder_on: FFaker::Time.datetime
end

puts "Create users"
users = {
  "do.ha.long@framgia.com": "Do Ha Long",
  "luu.thi.thom@framgia.com": "Luu Thi Thom",
  "thuy.viet.quoc@framgia.com": "Thuy Viet Quoc",
  "tran.anh.vu@fsramgia.com": "Tran Anh Vu",
  "le.quang.canh@sframgia.com": "Le Quang Anh",
  "user@gmail.com": "User",
  "ttkt1994@gmail.com": "User",
}

users.each do |email, name|
  user = User.create! name: name, email: email, password: "123456"
  InfoUser.create! user_id: user.id,
    introduction: "hello world, i am developer",
    address: "Da Nang, Viet Nam",
    phone: "123456789"
end

trainees = {
  "do.van.nam@framgia.com": "Do Van Nam",
  "nguyen.ha.phan@framgia.com": "Nguyen Ha Phan",
  "nguyen.ngoc.thinh@framgia.com": "Nguyen Ngoc Thinh",
  "tran.xuan.nam@framgia.com": "Tran Xuan Nam",
  "chu.kim.thang@framgia.com": "Chu Kim Thang",
  "bui.khanh.huyen@framgia.com": "Bui Khanh Huyen",
  "sonnguyenngoc1604@gmail.com": "Nguyen Ngoc Son"
}

trainees.each do |email, name|
  trainee = User.create! name: name, email: email, password: "123456",
    role: "trainee"
  InfoUser.create! user_id: trainee.id,
    introduction: "hello world, i am developer",
    address: "Da Nang, Viet Nam",
    phone: "123456789"
end

edu_admin = User.create! name: "Education admin",
  password: "123456",
  email: "admin.education@framgia.com"
InfoUser.create! user_id: edu_admin.id, introduction: "hello world, i am developer",
  address: "Da Nang, Viet Nam", phone: "123456789"

user = User.create! name: "Adminprp",
  email: "admin@gmail.com",
  password: "123456",
  role: "admin"
InfoUser.create! user_id: user.id, introduction: "hello world, i am developer",
  address: "Da Nang, Viet Nam", phone: "123456789"

puts "Create jobs"

job_data= [
  {
    company_name: "FPT software",
    jobs:[
      {
        title: "[FPT HO] - Chuyên gia chính sách nhân sự",
        describe: "<p>- Tham gia thực hiện các dự án nhân sự của Tập đoàn FPT: thực hiên một số việc, công đoạn trong dự án theo kế hoạch dự án.</p>
          <p>- Trực tiếp hoặc hỗ trợ biên soạn các chính sách nhân sự, quy định, quy trình, biểu mẫu, tài liệu về nhân sự theo phân công.</p>
          <p>- Trực tiếp hoặc hỗ trợ việc xem xét, phản biện, thẩm định các chính sách nhân sự của các Công ty thành viên trong Tập đoàn.</p>
          <p>- Tham gia tư vấn, hướng dẫn việc triển khai thực hiện chính sách nhân sự trong Tập đoàn.</p>
          <p>- Trực tiếp hoặc hỗ trợ phân tích các số liệu, báo cáo nhân sự định kỳ hoặc đột xuất.</p>
          <p>- Tìm hiểu các xu thế, mô hình quản trị nhân sự/các mảng nhân sự tiên tiên trên thế giới, đề xuất áp dụng vào FPT.</p>
          <p>- Công việc khác do Trưởng phòng giao.</p>"
      },
      {
        title: "QUẢN TRỊ NHẬN DIỆN THƯƠNG HIỆU",
        describe: "<p>Triển khai phát triển các ứng dụng nhận diện thương hiệu theo kế hoạch và phương án được phê duyệt.</p><p>Thực hiện  các hoạt động khảo sát đánh giá định kỳ về việc sử dụng bộ nhận diện thương hiệu FPT/thương hiệu nhánh theo Sổ tay thương hiệu, lập báo cáo liên quan và đưa ra đề xuất sửa đổi, bổ sung</p><p>Tổ chức thực hiện việc thiết kế/hỗ trợ thiết kế các hạng mục có sử dụng nhận diện thương hiệu FPT/Đơn vị, đảm bảo quy cách, tiêu chuẩn theo Sổ tay thương hiệu FPT, thương hiệu nhánh.</p><p>Tham gia hoạt động hỗ trợ và tư vấn việc xây dựng và phát triển các nhận diện thương hiệu cho Đơn vị, sản phẩm dịch vụ của Đơn vị có sử dụng nhận diện thương hiệu FPT/Đơn vị (Khi có yêu cầu).</p>"
      },
      {
        title: "[FPT HO] Quản lý quan hệ nhà đầu tư (SL: 01)",
        describe: "<p>- Kiểm soát các tài liệu tài chính: báo cáo hoạt động kinh doanh cho nhà đầu tư hàng quý, bản tin nhà đầu tư, thông cáo báo chí kinh doanh kết quả hàng tháng, báo cáo thường niên,...</p>
          <p>- Chuẩn bị các báo cáo, tài liệu cho Hội đồng quản trị, nhà đầu tư, ban điều hành</p>
          <p>- Phối hợp với các bên liên quan tổ chức sự kiện cho nhà đầu tư: các cuộc họp Đại hội cổ đông thường niên/bất thường, họp đầu tư hàng quý</p>
          <p>- Trực tiếp gặp gỡ, tiếp các nhà đầu tư tại công ty</p>
          <p>- Xây dựng mối quan hệ với các chuyên viên phân tích các công ty chứng khoán, chủ động trao đổi nhằm hạn chế tối đa việc sử dụng các thông tin không chính xác về công ty trong phân tích</p>
          <p>- Theo dõi các nguồn thông tin về FPT, và các báo cáo thị trường liên quan</p>"
      },
      {
        title: "Software Developer ( Attractive Salary )",
        describe: "<p>- Developing and maintaining Septeni Group's strategic products, responsible for writing maintainable, high performance and robust web based systems.</p>
          <p>- Competitive and stable salary (up to 1000$), with performance review and bonus twice a year</p>
          <p>- Company provided laptop (Macbook pro) and other necessary equipments or software</p>
          <p>- On site works at Japan head quarter (Tokyo) or a trip to attend corporation Kickoff party for Employee of the year</p>
          <p>- Working with excellent engineers from Vietnam and Japan on newest bleeding edge technologies</p>
          <p>- Open culture that focus on self improvement and sharing.</p>
          <p>- Baoviet Healthcare for all employees, company holiday trip and many other incentives</p>"
      },
      {
        title: "[$2,500 - $3,500] 5 Full-stack Developer - Làm Việc Ở Nhật",
        describe: "<p>- Bachelor degree in Information Technology, Computer Science, Electronics and Engineering</p>
          <p>- At least 2 years experience in software development with Java, C＃, Ruby, PHP, Python, Jython, Objective-C,..</p>
          <p>- Experience and expertise as a full-stack developer</p>
          <p>- Be able to use some framework depending on the language</p>
          <p>- OS: Windows, Linux, iOS, Android</p>
          <p>- Database: At least MySQL, if possible then Oracle, SQLServer, NoSQL.</p>　　
          <p>- Team development, development experience with Agile method such as Scrum</p>
          <p>- Having interest in working in Japan</p>
          <p>- Japanese language skill: N3 and above</p>"
      },
      {
        title: "Urgent! Server Game Developer ★ Up to $1500 ★",
        describe: "<p>YÊU CẦU CHUNG:</p>
          <p>- Nắm rõ hệ thống trên nền linux , viết được shell và bash trong linux</p>
          <p>- Thành thạo ngôn ngữ PHP trên nền Linux. Ưu tiên biết thêm một trong các ngôn ngữ sau: C++, Ruby,Python</p>
          <p>- Có kiến thức về SQL và noSQL, DB design biết cài đặt cấu hình cơ sở dữ liệu (hiểu về các loại engine trong database)</p>
          <p>- Có kiến thức về socket, state machine, process và thread</p>
          <p>ƯU TIÊN:</p>
          <p>- Có kinh nghiệm về AWS, GCP(Google Cloud Platform)</p>
          <p>- Có khả năng đọc source code có sẵn để hiểu logic của phần mềm</p>"
      },
      {
        title: "[$2,400 - $2,800] 10 Java Software Developer - Làm Việc Tại Nhật Bản",
        describe: "<p>- Bachelor degree in Information Technology, Computer Science, Electronics and Engineering</p>
          <p>- Highly motivated to work in Japan</p>
          <p>- Prefer candidate who have 2-year experience in software development by Java, C#, Ruby, PHP, Python, Objective-C</p>
          <p>- Expertise in Framework, OS (Windows, Linux, iOS, Android), Database (MySQL)</p>
          <p>- Minimum Japanese level : N3</p>
          <p>- Salary up to 8000$ (up to experience)</p>
          <p>- Having experience to work in Japanese company or in Japan is an advantage</p>
          <p>- Age limit: prefer under 35 years old</p>"
      }
    ]
  },
  {
    company_name: "Framgia VietNam",
    jobs: [
      {
        title: "【～$1500】 C++ Developer",
        describe: "<p>- Tham gia vào các dự án phần mềm với những doanh nghiệp hàng đầu Nhật Bản</p><p>- Phát triển các ứng dụng web và webservice, tìm hiểu các công nghệ mới</p><p>- Tham gia vào thiết kế và review source code</p><p>- Tiếp cận và được đào tạo theo mô hình phát triển dự án Agile, Scrum</p><p>- Luôn cập nhật tiến độ và thông báo tình trạng công việc trực tiếp tới quản lý dự án.</p>"
      },
      {
        title: "【～$1500】iOS Developers",
        describe: "<p>- Tham gia phân tích requirements, thiết kế hệ thống.</p><p>- Tham gia vào các dự án outsource với nhiều đối tác lớn (như nhật bản …).</p><p>- Tham gia vào phát triển các sản phẩm công ty.</p><p>- Làm việc trong môi trường chuyên nghiệp.</p><p>- Nghiên cứu và áp dụng các công nghệ mới.</p><p>- Cải tiến, nâng cao chất lượng các dự án hiện có.</p><p>- Tham gia vào các diễn dàn/ tech show về công nghệ của công ty</p>"
      },
      {
        title: "【～$2800】 Project Manager ( Japanese Skill )",
        describe: "<p> Tham gia vào việc xây dựng và phát triển Công ty</p><p> Quản lý các dự án trong Công ty: Ruby, iOS, Android, PHP, ...</p><p>• Trao đổi trực tiếp với Khách hàng về tình hình dự án</p><p>• Làm việc với các thành viên của đội dự án, đảm bảo đáp ứng các yêu cầu về chất lượng và thời hạn của dự án</p><p>• Báo cáo với Division Manager về tình hình dự án</p>"
      },
      {
        title: "[ Tuyển Gấp ] Kỹ Sư Phần Mềm - Developer",
        describe: "<p>Lập trình phát triển hệ thống.</p>
          <p>Phân tích, thiết kế, tìm hiểu yêu cầu của khách hàng.</p>
          <p>Phát triển hệ thống nghiệp vụ cơ bản đang được sử dụng ở các doanh nghiệp, chủ yếu là doanh nghiệp Nhật Bản.</p>"
      },
      {
        title: "Software Developer ( Attractive Salary )",
        describe: "<p>- Developing and maintaining Septeni Group's strategic products, responsible for writing maintainable, high performance and robust web based systems.</p>
          <p>- Competitive and stable salary (up to 1000$), with performance review and bonus twice a year</p>
          <p>- Company provided laptop (Macbook pro) and other necessary equipments or software</p>
          <p>- On site works at Japan head quarter (Tokyo) or a trip to attend corporation Kickoff party for Employee of the year</p>
          <p>- Working with excellent engineers from Vietnam and Japan on newest bleeding edge technologies</p>
          <p>- Open culture that focus on self improvement and sharing.</p>
          <p>- Baoviet Healthcare for all employees, company holiday trip and many other incentives</p>"
      },
      {
        title: "Senior Back-end Developer [URGENT]",
        describe: "<p>•  Vietnamese nationality;</p>
          <p>• University degree;</p>
          <p>• 3 – 4 years of working experience. </p>
          <p>• Strong technical background; More than 2 years of experience in web
          application development.</p>
          <p>• Proficiency in Object Oriented Design and Design Patterns.</p>
          <p>• Strong in JavaScript/CSS/HTML.</p>
          <p>• Having experience with one of the following: Java, .NET (C#, ASP, WPF), Ruby, PHP.</p>
          <p>• Strong knowledge about RDBMS, Mongodb/ Redis.</p>
          <p>• Preferred if having experience in Cloud server development with Amazon AWS or Microsoft Azure.</p>"
      }
    ]
  }
]

job_data.each do |data|
  company = Company.find_by name: data[:company_name]
  if company
    data[:jobs].each do |job|
      Job.create! company_id: company.id, title: job[:title],
        describe: job[:describe],
        type_of_candidate: 1, who_can_apply: 1, status: 0,
        posting_time: Time.zone.now
    end
  end
end

puts "Create Candidate"
users = User.limit(20).pluck(:id)
users.each do |candidate|
  jobs = Job.order("Random()").limit(20).pluck :id
  interested_in = [:have_a_chat, :work_together, :opportunity].shuffle.first
  process = [:apply, :fail_test, :joined , :pass_test, :wait_test].shuffle.first
  jobs.each do |job|
    Candidate.create! user_id: candidate, job_id: job,
      interested_in: interested_in, process: process
  end
end

puts "Update counter cache candidate"
Job.all.each do |job|
  Job.update_counters job.id, candidates_count: job.candidates.length
end

puts "Create employee of company"
User.all.each do |user|
  Employee.create! user_id: user.id, company_id: 1,
    description: FFaker::Lorem.sentence
end

puts "Create addresses of company"
Company.all.each do |company|
  Address.create! company_id: company.id,
    address: FFaker::Address.city,
    head_office: 1
end

puts "Create skills"
6.times do
  Skill.create name: FFaker::Skill.tech_skill
end

puts "Assign skill to user"
User.all.each do |user|
  skills = Skill.order("Random()").limit(2).pluck(:id)
  skills.each do |skill|
    SkillUser.create! user_id: user.id, skill_id: skill,
    years: rand(1..3)
  end
end

puts "Create skills are required by jobs"
Job.all.each do |job|
  skills = Skill.order("Random()").limit(4).pluck(:id)
  skills.each do |skill|
    JobSkill.create! job_id: job.id, skill_id: skill
  end
end

puts "create default course of user"
user = User.create! email: "tran.tuan.nghia@framgia.com",
  name: "Tran Tuan Nghia",
  password: "123456"

InfoUser.create! user_id: user.id, introduction: "humman development",
  ambition: "become to rich man", quote: "human", phone: "123456789",
  birthday: "1996-11-05", occupation: "student", gender: "male"

programming_language = ProgrammingLanguage.create name: "ruby"

courses = [
  {
    name: "[KN] Ruby on Rails 03/10/2016", start_date: "2016-10-03",
    end_date: "2016-11-11", status: "finished",
    description:  "training ruby in two months"
  },
  {
    name: "PHP 03/11/2016", start_date: "2016-11-03",
    end_date: "2016-11-05", status: "finished",
    description:  "training PHP in two months"
  }
]
courses.each do |course|
  course_create = Course.create! name: course[:name],
    start_date: course[:start_date],
    end_date: course[:end_date],
    status: course[:status],
    programming_language_id: programming_language.id,
    description: course[:description]

  UserCourse.create! user_id: user.id, course_id: course_create.id
end

puts "create default subject of user"
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

puts "create default subject of user"
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

    UserTask.create! user_id: user.id,
      task_id: task_created.id, subject_id: subject.id,
      course_id: course.id,
      status: data[:status]
  end
end
