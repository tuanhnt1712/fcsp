require "net/http"

class Api::HttpActionService
  def initialize url, params, auth_token = "", emails = ""
    @uri = URI url
    @params = params
    @auth_token = auth_token
    @emails = emails
  end

  def get_data
    http = Net::HTTP.new(@uri.host, @uri.port).start
    request = Net::HTTP::Post.new(@uri.request_uri,
      "TMS-AUTH-TOKEN": @auth_token)
    data = {"emails[]": @emails}
    request.set_form_data data
    http.request request
  rescue StandardError
    false
  end

  def post_data
    Net::HTTP.post_form @uri, @params
  rescue StandardError
    false
  end

  def tms_user_exist?
    response = self.get_data
    response && response.code.to_i == 404 ? false : true
  end
end
