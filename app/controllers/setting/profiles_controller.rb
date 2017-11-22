class Setting::ProfilesController < Setting::BaseController
  before_action :retrieve_info_user

  def index
  end

  private

  def retrieve_info_user
    @info_user = current_user.info_user
  end
end
