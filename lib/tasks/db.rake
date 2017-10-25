require "ffaker"

namespace :db do
  desc "Seeding data"
  task seeding: :environment do
    if Rails.env.production?
      puts "Do not running in 'Production' task"
    else
      %w[db:drop db:create db:migrate db:seed].each do |task|
        Rake::Task[task].invoke
      end

      puts "Create companies"
      companies = {
        "Framgia VietNam": "Kobayashi Taihei",
        "FPT software": "Hoang Nam Tien",
        "BraveBits": "Alex Ferguson",
        "VC Corp": "Vuong Vu Thang",
        "Ipcoms": "Vu Minh Tuan"
      }

      companies.each do |name, founder|
        Company.create! name: name, introduction: FFaker::Lorem.paragraph,
          website: FFaker::Internet.domain_name, founder: founder,
          company_size: 100, founder_on: FFaker::Time.datetime,
          creator_id: 1
      end

      puts "Create users"
      users = {
        "do.ha.long@framgia.com": "Do Ha Long",
        "do.van.nam@framgia.com": "Do Van Nam",
        "nguyen.ha.phan@framgia.com": "Nguyen Ha Phan",
        "luu.thi.thom@framgia.com": "Luu Thi Thom",
        "thuy.viet.quoc@framgia.com": "Thuy Viet Quoc",
        "tran.anh.vu@fsramgia.com": "Tran Anh Vu",
        "le.quang.canh@sframgia.com": "Le Quang Anh",
        "nguyen.ngoc.thinh@framgia.com": "Nguyen Ngoc Thinh",
        "tran.xuan.nam@framgia.com": "Tran Xuan Nam",
        "user@gmail.com": "User",
        "ttkt1994@gmail.com": "User",
        "chu.kim.thang@framgia.com": "Chu Kim Thang",
        "bui.khanh.huyen@framgia.com": "Bui Khanh Huyen",
        "sonnguyenngoc1604@gmail.com": "Nguyen Ngoc Son"
      }

      user = User.create! name: "Hoang Thi Nhung",
        email: "hoang.thi.nhung@framgia.com",
        password: "123456",
        company_id: 1,
        role: 2
      InfoUser.create! user_id: user.id, introduce: Faker::Lorem.paragraph,
          address: "Da Nang, Viet Nam"

      users.each do |email, name|
        user = User.create! name: name, email: email, password: "123456"
        InfoUser.create! user_id: user.id, introduce: Faker::Lorem.paragraph,
          address: "Da Nang, Viet Nam"
      end

      edu_admin = User.create! name: "Education admin",
        password: "123456",
        email: "admin.education@framgia.com"
      InfoUser.create! user_id: edu_admin.id, introduce: Faker::Lorem.paragraph,
        address: "Da Nang, Viet Nam"

      user = User.create! name: "Adminprp",
        email: "admin@gmail.com",
        password: "123456",
        role: 1
      InfoUser.create! user_id: user.id, introduce: Faker::Lorem.paragraph,
        address: "Da Nang, Viet Nam"

      puts "Create jobs"
      2.times do |i|
        20.times do
          title = FFaker::Lorem.sentence
          describe = FFaker::Lorem.paragraph
          Job.create! company_id: rand(1..2), title: title, describe: describe,
            type_of_candidate: 1, who_can_apply: 1, status: i,
            posting_time: Time.zone.now
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
          level: rand(1..6)
        end
      end

      puts "Create skills are required by jobs"
      Job.all.each do |job|
        skills = Skill.order("Random()").limit(4).pluck(:id)
        skills.each do |skill|
          JobSkill.create! job_id: job.id, skill_id: skill
        end
      end

      puts "Create Employer"
      Rake::Task["db:employer"].invoke
    end
  end
end
