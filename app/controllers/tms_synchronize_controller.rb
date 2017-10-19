class TmsSynchronizeController < ApplicationController
  before_action :authenticate_tms

  def index
    email = [current_user.email]
    tms_synchronize = Api::TmsDataService.new email, @user_token
    data_json = tms_synchronize.synchronize_tms_data
    if data_json && Api::Synchronize.synchronize_data(data_json)
      flash[:success] = t ".synchronize_success"
    else
      flash[:error] = t ".synchronize_fail"
    end
    redirect_to current_user
  end
end
