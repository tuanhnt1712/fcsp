class Setting::ProfilesController < Setting::BaseController
  def index
    @user = User.find_by id: current_user.id
    redirect_to root_path, flash: {danger: t(".something_wrong")} unless @user
  end
end
