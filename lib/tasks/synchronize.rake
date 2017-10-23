namespace :db do
  desc "auto synchronize data"
  task synchronize: :environment do
    puts "starting auto synchronize"
    emails = User.all.want_auto_sync.pluck :email
    authen_service = Api::AuthenticateService.new(ENV["TMS_ADMIN_EMAIL"],
      ENV["TMS_ADMIN_PASSWORD"]).tms_authenticate
    if authen_service
      user_token = authen_service["authen_token"]
      data_json = Api::TmsDataService.new(emails, user_token)
        .synchronize_tms_data
      if data_json
        Api::Synchronize.synchronize_data data_json
      end
    end
    puts "auto synchronize finish"
  end
end
