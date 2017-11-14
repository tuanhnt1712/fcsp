class Setting::BaseController < ApplicationController
  before_action :authenticate_user!
  layout "layouts/application"
end
