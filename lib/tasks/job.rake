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
