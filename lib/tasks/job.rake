namespace :db do
  desc "create job"
  task job: :environment do
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
            type_of_candidate: 1, who_can_apply: 1, status: rand(0..1),
            posting_time: Time.zone.now
        end
      end
    end
  end
end
