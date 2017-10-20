class Api::TmsDataService
  def initialize emails, user_token
    @url = Settings.api.tms_data_link
    @emails = emails
    @auth_token = user_token
  end

  def synchronize_tms_data
    http_request = Api::HttpActionService.new @url, "", @auth_token, @emails
    response = http_request.get_data
    if response && response.code.to_i == 200
      return JSON.parse response.body
    end
    false
  end
end
