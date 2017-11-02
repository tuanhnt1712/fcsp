require "devise/orm/active_record"

Devise.setup do |config|
  config.secret_key = "e402bf4f6d4040f9e4a0ed139d55fd9acf1cb9b7af3b1e0aafc72a3037eaff320156431d02d672691bbeb2f177161e261403914125481859c0c5190a9855ed56"
  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.omniauth :hr_system, ENV["HR_SYSTEM_APP_ID"], ENV["HR_SYSTEM_APP_SECRET"]
  Warden::Manager.before_logout do |user,auth,opts|
    auth.cookies.delete :authen_service
    auth.cookies.delete :tms_user
  end
end
