class Setting::ShareProfilesController < ApplicationController
  before_action :authenticate_user!

  def create
    ShareProfile.find_shared(current_user.id).delete_all

    if params[:share_profile_id]
      share_profile_ids = params[:share_profile_id].reject {|id|
        User.find_by(id: id).nil?
      }
      share_profile_ids.each do |share_id|
        user = User.find_by id: share_id
        current_user.add_share user
      end
    end
    redirect_to setting_root_url
  end
end
